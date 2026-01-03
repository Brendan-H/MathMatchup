/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserRepository.java) Last Modified on 9/5/24, 5:33 PM
 *
 */

package com.brendanharan.mathmatchupbackend.users;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUid(String uid);

    User findByEmail(String email);

    List<User> findBySchoolIdAndRole(Long schoolID, String role);
}
