/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (player_analytics.dart) Last Modified on 2/7/25, 8:05 PM
 *
 */

//File to hold providers for questions right or wrong
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app.dart';
import '../../../utils/constants.dart';
import '../../homescreen/presentation/homescreen.dart';
import '../domain/question_timer.dart';

final correctAnswersProvider = StateProvider<int>((ref) => 0);
final incorrectAnswersProvider = StateProvider<int>((ref) => 0);

void finalizeAnalytics(WidgetRef ref) {
  final correctAnswers = ref.read(correctAnswersProvider.notifier).state;
  final incorrectAnswers = ref.read(incorrectAnswersProvider.notifier).state;
  final questionTimes = ref.read(questionTimeProvider.notifier).state;
  final playerID = ref.read(playerIdProvider.notifier).state ?? 0;
  final gameCode = ref.read(gameCodeProvider.notifier).state;
  double averageTime = 0.0;
  final totalQuestions = correctAnswers + incorrectAnswers;
  final double accuracy = (correctAnswers / totalQuestions) * 100;

  questionTimes.forEach((key, value) {
    print('Question $key: ${value.inMilliseconds / 1000}');
    averageTime += value.inMilliseconds;
  });
  averageTime /= totalQuestions;
  averageTime /= 1000;
  averageTime = averageTime.toStringAsFixed(4) as double;
  print('Correct Answers: $correctAnswers');
  print('Incorrect Answers: $incorrectAnswers');
  print('Total Questions: $totalQuestions');
  print('Average Time: $averageTime');
  print('Accuracy: $accuracy');

  sendAnalyticsToServer(correctAnswers, incorrectAnswers, totalQuestions, averageTime, accuracy, playerID, gameCode);
}

void sendAnalyticsToServer(int correct, int incorrect, int total, double averageTime, double accuracy, int playerID, String gameCode) {
  print('Sending analytics to server');
  var backendurl = Constants.backendurl;
  Dio dio = Dio();
}