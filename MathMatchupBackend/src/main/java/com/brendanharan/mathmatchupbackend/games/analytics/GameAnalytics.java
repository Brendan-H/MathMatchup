/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameAnalytics.java) Last Modified on 2/9/25, 2:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games.analytics;

import com.brendanharan.mathmatchupbackend.games.Game;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="game_analytics")
public class GameAnalytics {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "game_id", nullable = false, unique = true)
    private Game game;

    @Column(nullable = false)
    private double averageCorrect;

    @Column(nullable = false)
    private int totalCorrect;

    @Column(nullable = false)
    private double averageScore;

    @Column(nullable = false)
    private double averageTime;

    @Column(nullable = false)
    private double averageIncorrect;

    @Column(nullable = false)
    private int totalIncorrect;

    @Column(nullable = false)
    private int totalPoints;

    @Column(nullable = false)
    private double totalAccuracy;

    @Column(nullable = false)
    private int totalQuestions;

}
