/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerAnalytics.java) Last Modified on 2/9/25, 2:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players.analytics;

import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.players.Player;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Getter
@Setter
@Table(name = "player_analytics")
public class PlayerAnalytics {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "game_id", nullable = false)
    @JsonIgnore
    private Game game;

    @OneToOne
    @JoinColumn(name = "player_id", nullable = false)
    private Player player;

    @Column(nullable = false)
    private int totalCorrect;

    @Column(nullable = false)
    private int totalIncorrect;

    @Column(nullable = false)
    private int totalQuestions;

    @Column(nullable = false)
    private double averageTime;

    @Column(nullable = false)
    private double accuracy;

    @Column(nullable = false)
    private double points;
}