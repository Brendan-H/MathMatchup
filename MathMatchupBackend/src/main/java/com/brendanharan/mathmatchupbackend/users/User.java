/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (User.java) Last Modified on 9/3/24, 5:14 PM
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

@Entity
@Table(name = "users")
@Getter
@Setter
@Accessors(chain = true)
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

    //autogenerate this field for admin users, but will be manually set for school users

    @Setter(AccessLevel.NONE)
    private Long schoolId;

    @JsonProperty("isAdmin")
    private boolean isAdmin;

    public void setSchoolId(Long schoolId) {
        if (this.isAdmin) {
            // Auto-generate schoolId for admin users
            this.schoolId = generateSchoolId();
        } else {
            // Manually set schoolId for school users
            this.schoolId = schoolId;
        }
    }

    private Long generateSchoolId() {
       //generate a random number that is pretty much guaranteed to be unique without needing checks
        return System.nanoTime() + (long) (Math.random() * 10000000);
    }

}

