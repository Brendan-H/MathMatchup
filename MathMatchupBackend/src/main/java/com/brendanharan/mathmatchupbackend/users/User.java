/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (User.java) Last Modified on 9/13/24, 11:19 AM
 *
 */

package com.brendanharan.mathmatchupbackend.users;

import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.teams.Team;
import com.brendanharan.mathmatchupbackend.teams.TeamId;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.UUID;

@Entity
@Table(name = "users")
@Getter
@Setter
@Accessors(chain = true) // Enable method chaining
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String uid;

    @Column(nullable = false, unique = true)
    private String email;

    private String displayName;

    private String role;

    private String school;


    @Setter(AccessLevel.NONE) // Disable direct setting of schoolId using @Setter so that we can control how it is set
    private Long schoolId;

    @JsonProperty("isAdmin")
    private boolean isAdmin;

    public void setSchoolId(Long schoolId) {
        if (this.isAdmin) {
            // Auto-generate the schoolId for admin users
            this.schoolId = generateSchoolId();
        } else {
            // Manually set schoolId for school users using the provided value (which will be the same as the admin's)
            this.schoolId = schoolId;
        }
    }

    private Long generateSchoolId() {
        //generate uuid
        return UUID.randomUUID().getMostSignificantBits() & Long.MAX_VALUE;
       //return System.nanoTime() + (long) (Math.random() * 10000000);
    }

}

