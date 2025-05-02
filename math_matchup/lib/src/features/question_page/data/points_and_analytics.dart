/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (points_and_analytics.dart) Last Modified on 2/9/25, 1:41 PM
 *
 */
class PointsAndAnalytics {
  int points;
  int correctAnswers;
  int incorrectAnswers;
  int totalQuestions;
  double averageTime;
  double accuracy;

  PointsAndAnalytics({
    required this.points,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.totalQuestions,
    required this.averageTime,
    required this.accuracy,
  });
}
