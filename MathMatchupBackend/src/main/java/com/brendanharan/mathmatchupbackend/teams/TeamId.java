/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (TeamId.java) Last Modified on 9/5/24, 5:33 PM
 *
 */

package com.brendanharan.mathmatchupbackend.teams;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
public class TeamId implements Serializable {

    @Column(name = "game_id")
    private Long gameId;

    @Column(name = "team_id")
    private Long teamId;



    public TeamId() {
        this.gameId = 0L;
        this.teamId = 0L;
    }

    public TeamId(Long gameId, Long teamId) {
        this.gameId = gameId;
        this.teamId = teamId;
    }
}