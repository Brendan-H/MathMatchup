/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserController.java) Last Modified on 9/13/24, 11:37 AM
 *
 */

package com.brendanharan.mathmatchupbackend.users;


import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStreamReader;
import java.io.Reader;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController
{
    @Autowired
    private UserService userService;

    @PostMapping ("/create")
    public void createUser(@RequestBody User user) throws Exception {
        userService.createUser(user);
    }

    @PostMapping ("/teachers/create")
    public void createTeacher(@RequestParam("name") String name, @RequestParam("email") String email, Authentication authentication) throws Exception {
        String adminUID = (String) authentication.getPrincipal();
        User admin = userService.getUserByUid(adminUID);
        userService.createTeacher(
                name,
                email,
                admin.getSchoolId(),
                admin.getSchool()
        );
    }

//    @GetMapping ("/findbyuid")
//    public User getUserByUid(String uid) {
//        return userService.getUserByUid(uid);
//    }

    @GetMapping("/current")
    public ResponseEntity<?> getCurrentUser(Authentication authentication) {
        String uid = (String) authentication.getPrincipal();
        User user = userService.getUserByUid(uid);

        if (user == null) {
            return ResponseEntity.status(404)
                    .body("User not found in db");
        }

        return ResponseEntity.ok(user);
    }

    @GetMapping("/teachers")
    public List<User> getTeachersBySchool(@RequestParam("schoolID") String schoolID) {
        return userService.getTeachersBySchool(schoolID);
    }


    @PostMapping("/bulkcreate")
    public void bulkCreateUsers(@RequestParam("usersCSV") MultipartFile usersCSV, Authentication authentication) throws Exception {
        Reader reader = new InputStreamReader(usersCSV.getInputStream());
//use opencsv to read the csv file and leave it as List<String[]> rows

        CSVReader csvReader = new CSVReaderBuilder(reader).withSkipLines(1).build();

        List<String[]> rows = csvReader.readAll();
        if (rows.isEmpty()) {
            throw new IllegalArgumentException("CSV file is empty or only contains headers");
        }
        if (rows.get(0).length < 3) {
            throw new IllegalArgumentException("CSV file must contain 3 columns: email,lastName,firstName");
        }
        String adminUID = (String) authentication.getPrincipal();
        User admin = userService.getUserByUid(adminUID);
        String schoolID = admin.getSchoolId();
        String school = admin.getSchool();

        userService.bulkCreateUsers(rows, schoolID, school);
    }
}
