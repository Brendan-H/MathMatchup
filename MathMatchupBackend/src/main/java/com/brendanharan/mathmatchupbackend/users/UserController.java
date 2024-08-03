/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserController.java) Last Modified on 8/2/24, 6:14 PM
 *
 */

package com.brendanharan.mathmatchupbackend.users;


import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.UserRecord;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.exceptions.CsvException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController
{
    @Autowired
    private UserService userService;

    @PostMapping ("/create")
    public void createUser(User user) throws Exception {
        userService.createUser(user);
    }

    @GetMapping ("/findbyuid")
    public User getUserByUid(String uid) {
        return userService.getUserByUid(uid);
    }

    @PostMapping("/bulkcreate")
    public void bulkCreateUsers(@RequestParam MultipartFile usersCSV) throws Exception {
        Reader reader = new InputStreamReader(usersCSV.getInputStream());
//use opencsv to read the csv file and leave it as List<String[]> rows

        CSVReader csvReader = new CSVReaderBuilder(reader).withSkipLines(1).build();

        List<String[]> rows = csvReader.readAll();

        userService.bulkCreateUsers(rows);
    }
}
