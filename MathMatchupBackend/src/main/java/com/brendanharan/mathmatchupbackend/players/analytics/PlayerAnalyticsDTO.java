/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerAnalyticsDTO.java) Last Modified on 2/11/25, 9:58 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players.analytics;

import lombok.Getter;

@Getter
public class PlayerAnalyticsDTO {
    private int totalCorrect;
    private int totalIncorrect;
    private int totalQuestions;
    private double averageTime;
    private double accuracy;
    private double points;
    private Long playerId;
    private String playerName;

    public PlayerAnalyticsDTO(PlayerAnalytics playerAnalytics) {
        this.totalCorrect = playerAnalytics.getTotalCorrect();
        this.totalIncorrect = playerAnalytics.getTotalIncorrect();
        this.totalQuestions = playerAnalytics.getTotalQuestions();
        this.averageTime = playerAnalytics.getAverageTime();
        this.accuracy = playerAnalytics.getAccuracy();
        this.points = playerAnalytics.getPoints();
        this.playerId = playerAnalytics.getPlayer().getId();
        this.playerName = playerAnalytics.getPlayer().getName();
    }
}
