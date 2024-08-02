/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserService.java) Last Modified on 8/2/24, 6:06 PM
 *
 */

package com.brendanharan.mathmatchupbackend.users;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.UserRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void createUser(User user) throws Exception {
        userRepository.save(user);
    }

    public User getUserByUid(String uid) {
        return userRepository.findByUid(uid);
    }
}

