/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (subtraction_question.dart) Last Modified on 5/1/25, 11:43 PM
 *
 */

import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/features/question_page/data/question.dart';
import '../../game_settings_page/presentation/game_settings_page.dart';

Question generateSubtractionQuestion(WidgetRef ref) {
  final difficulty = ref.read(selectedDifficultyProvider.notifier).state;
  final digitsPerNumber = difficulty == "Easy" ? 1 :
  difficulty == "Medium" ? 2 :
  difficulty == "Hard" ? 3 :
  difficulty == "Impossible" ? 4
      : 1; //default to easy
  int maxNumber = 10;
  //maxNumber is the max distance from the correct answer that the incorrect answers can be
  final random = Random();
  // Generate two random numbers
  final num1 = random.nextInt(pow(10, digitsPerNumber).toInt());
  final num2 = random.nextInt(pow(10, digitsPerNumber).toInt());

  // Calculates the answer to the question
  final correctAnswer = (num1 - num2).toString();

  // Generates three other believable incorrect answers that are MaxNumber away from the correct answer
  List<String> answerChoices = [];
  while (answerChoices.length < 3) {
    final incorrectAnswer = random.nextBool()
        ? (int.parse(correctAnswer) + random.nextInt(maxNumber)).toString()
        : (int.parse(correctAnswer) - random.nextInt(maxNumber)).toString();
    if (incorrectAnswer != correctAnswer && !answerChoices.contains(incorrectAnswer)) {
      answerChoices.add(incorrectAnswer);
    }
  }

  // Shuffles the answer choices
  answerChoices..add(correctAnswer)..shuffle();

  // Creates the question that's displayed
  final question = '$num1 - $num2 = ?';

  return Question(
    question: question,
    answerChoices: answerChoices,
    correctAnswer: correctAnswer,
  );

}