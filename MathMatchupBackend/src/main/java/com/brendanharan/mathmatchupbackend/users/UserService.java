/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserService.java) Last Modified on 9/13/24, 11:43 AM
 *
 */

package com.brendanharan.mathmatchupbackend.users;

import com.google.firebase.auth.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;


    //Allows for Firebase to be disabled for testing, defaults to on but is shut off in tests
    //Firebase is still mocked in tests, but this prevents real calls from happening
    @Value("${firebase.enabled:true}")
    private boolean firebaseEnabled;

    // CreateUser doesnt need to use firebase because creation on firebase is handled on the frontend
    public void createUser(User user) throws Exception {
        user.setSchoolId(user.getSchoolId());
        userRepository.save(user);
    }

    public User getUserByUid(String uid) {
        return userRepository.findByUid(uid);
    }

    //bulkCreateUsers needs firebase because you cant bulk create on the frontend
    public void bulkCreateUsers(List<String[]> rows, Long schoolID, String school) throws Exception {
        List<ImportUserRecord> users = new ArrayList<>();
        for (String[] row : rows) {
            String email = row[0];
            String lastName = row[1];
            String firstName = row[2];
            String displayName = firstName + " " + lastName;
            String uid = UIDGenerator.generatePushId();
            System.out.println("Creating user with email: " + email + " and display name: " + displayName + " and uid: " + uid);
            users.add(ImportUserRecord.builder()
                    .setEmail(email)
                    .setEmailVerified(false)
                    .setDisplayName(displayName)
                    .setUid(uid)
                    .build());
        }

        if (firebaseEnabled) {  // Prevent Firebase calls in tests
            try {
                UserImportResult result = FirebaseAuth.getInstance().importUsers(users);
                System.out.println("Successfully imported " + result.getSuccessCount() + " users");
                System.out.println("Failed to import " + result.getFailureCount() + " users");
                for (ErrorInfo indexedError : result.getErrors()) {
                    System.out.println("Failed to import user at index: " + indexedError.getIndex()
                            + " due to error: " + indexedError.getReason());
                }
            } catch (FirebaseAuthException e) {
                log.error("e: ", e);
            }
        }


        for (String[] row : rows) {
            String email = row[0];
            String lastName = row[1];
            String firstName = row[2];
            String displayName = firstName + " " + lastName;
            String uid = UIDGenerator.generatePushId();

            User newUser = new User();
            newUser.setEmail(email);
            newUser.setDisplayName(displayName);
            newUser.setUid(uid);
            newUser.setRole("Teacher");
            newUser.setSchool(school);
            newUser.setSchoolId(schoolID);
            userRepository.save(newUser);
        }
    }

    public List<User> getTeachersBySchool(Long schoolID) {
        return userRepository.findBySchoolIdAndRole(schoolID, "teacher");
    }
}

