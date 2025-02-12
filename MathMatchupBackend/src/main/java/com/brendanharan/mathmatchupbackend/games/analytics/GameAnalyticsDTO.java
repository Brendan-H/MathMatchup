/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameAnalyticsDTO.java) Last Modified on 2/11/25, 9:58 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games.analytics;

import com.brendanharan.mathmatchupbackend.players.analytics.PlayerAnalyticsDTO;
import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;


@Getter
public class GameAnalyticsDTO {
    private double averageCorrect;
    private int totalCorrect;
    private double averageScore;
    private double averageTime;
    private double averageIncorrect;
    private int totalIncorrect;
    private int totalPoints;
    private double totalAccuracy;
    private int totalQuestions;
    private List<PlayerAnalyticsDTO> playerAnalyticsList;

    public GameAnalyticsDTO(GameAnalytics gameAnalytics) {
        this.averageCorrect = gameAnalytics.getAverageCorrect();
        this.totalCorrect = gameAnalytics.getTotalCorrect();
        this.averageScore = gameAnalytics.getAverageScore();
        this.averageTime = gameAnalytics.getAverageTime();
        this.averageIncorrect = gameAnalytics.getAverageIncorrect();
        this.totalIncorrect = gameAnalytics.getTotalIncorrect();
        this.totalPoints = gameAnalytics.getTotalPoints();
        this.totalAccuracy = gameAnalytics.getTotalAccuracy();
        this.totalQuestions = gameAnalytics.getTotalQuestions();

        this.playerAnalyticsList = gameAnalytics.getPlayerAnalyticsList().stream()
                .map(PlayerAnalyticsDTO::new)
                .collect(Collectors.toList());
    }
}