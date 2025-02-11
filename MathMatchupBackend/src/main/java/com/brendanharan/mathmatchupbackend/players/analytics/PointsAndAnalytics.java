/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PointsAndAnalytics.java) Last Modified on 2/9/25, 2:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players.analytics;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class PointsAndAnalytics {
    private int points;
    private int correctAnswers;
    private int incorrectAnswers;
    private int totalQuestions;
    private double averageTime;
    private double accuracy;
}
