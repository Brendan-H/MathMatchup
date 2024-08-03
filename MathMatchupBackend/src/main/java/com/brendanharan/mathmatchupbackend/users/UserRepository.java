/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserRepository.java) Last Modified on 8/2/24, 6:05 PM
 *
 */

package com.brendanharan.mathmatchupbackend.users;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUid(String uid);

    User findByEmail(String email);
}
