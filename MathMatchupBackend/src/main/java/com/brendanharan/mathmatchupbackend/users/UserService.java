/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserService.java) Last Modified on 9/2/24, 9:00 PM
 *
 */

package com.brendanharan.mathmatchupbackend.users;

import com.google.firebase.auth.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void createUser(User user) throws Exception {
        user.setSchoolId(user.getSchoolId());
        userRepository.save(user);
    }

    public User getUserByUid(String uid) {
        return userRepository.findByUid(uid);
    }

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
}

