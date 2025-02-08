/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (player_analytics.dart) Last Modified on 2/7/25, 8:05 PM
 *
 */

//File to hold providers for questions right or wrong
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/question_timer.dart';

final correctAnswersProvider = StateProvider<int>((ref) => 0);
final incorrectAnswersProvider = StateProvider<int>((ref) => 0);

void finalizeAnalytics(WidgetRef ref) {
  final correctAnswers = ref.read(correctAnswersProvider.notifier).state;
  final incorrectAnswers = ref.read(incorrectAnswersProvider.notifier).state;
  final questionTimes = ref.read(questionTimeProvider.notifier).state;
  double averageTime = 0.0;
  final totalQuestions = correctAnswers + incorrectAnswers;

  questionTimes.forEach((key, value) {
    print('Question ${key}: ${value.inMilliseconds / 1000}');
    averageTime += value.inMilliseconds;
  });
  averageTime /= totalQuestions;
  averageTime /= 1000;
  print('Correct Answers: ${correctAnswers}');
  print('Incorrect Answers: ${incorrectAnswers}');
  print('Total Questions: ${totalQuestions}');
  print('Average Time: ${averageTime.toStringAsFixed(4)}');

  //TODO send to server
}