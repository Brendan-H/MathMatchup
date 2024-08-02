/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserController.java) Last Modified on 8/2/24, 6:14 PM
 *
 */

package com.brendanharan.mathmatchupbackend.users;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
