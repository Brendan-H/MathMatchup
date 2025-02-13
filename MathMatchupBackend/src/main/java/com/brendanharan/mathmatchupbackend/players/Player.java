    /*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (Player.java) Last Modified on 2/9/25, 2:47 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;


import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.players.analytics.PlayerAnalytics;
import com.brendanharan.mathmatchupbackend.teams.Team;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "players")
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
            @JoinColumn(name = "team_game_id", referencedColumnName = "game_id"),
            @JoinColumn(name = "team_team_id", referencedColumnName = "team_id")
    })
    @JsonIgnoreProperties({"game"})
    @JsonIgnore
    private Team team;

    @Column(nullable = false, name = "points")
    private int points;

    @OneToOne(mappedBy = "player", cascade = CascadeType.ALL)
    @JsonIgnore
    private PlayerAnalytics playerAnalytics;

    public void updatePoints(int pointsToAdd, int teamSize) {
        if (teamSize == 3) {
            this.points += (int) Math.round(pointsToAdd * 2.0 / 3.0);
        } else {
            this.points += pointsToAdd;
        }
    }
}