/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (Player.java) Last Modified on 9/5/24, 5:16 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;


import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.teams.Team;
import com.brendanharan.mathmatchupbackend.teams.TeamId;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "players")
@Getter
@Setter
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "game_id", nullable = false)
    @JsonIgnore
    private Game game;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
            //the first line here makes a duplicate of the regular game_id column but I'm too lazy to fix the error
            //that appears when I remove it so it's staying for now
            @JoinColumn(name = "team_game_id", referencedColumnName = "game_id"),
            @JoinColumn(name = "team_team_id", referencedColumnName = "team_id")
    })
    @JsonIgnoreProperties({"game"})
    @JsonIgnore
    private Team team;

    @Column(nullable = false, name = "points")
    private int points;

    public void updatePoints(int pointsToAdd, int teamSize) {
        if (teamSize == 3) {
            this.points += (int) Math.round(pointsToAdd * 2.0 / 3.0);
        } else {
            this.points += pointsToAdd;
        }
    }


}