/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PointsAndAnalytics.java) Last Modified on 2/9/25, 1:47 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class PointsAndAnalytics {
    int points;
    int correctAnswers;
    int incorrectAnswers;
    int totalQuestions;
    double averageTime;
    double accuracy;
}
