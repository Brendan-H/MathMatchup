/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (addition_question.dart) Last Modified on 6/24/24, 12:59 PM
 *
 */

import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/features/game_settings_page/presentation/game_settings_page.dart';

import '../../../app.dart';


class AdditionQuestion {
  String question;
  List<String> answerChoices;
  String correctAnswer;

  AdditionQuestion({
    required this.question,
    required this.answerChoices,
    required this.correctAnswer,
  });
}

AdditionQuestion generateAdditionQuestion(WidgetRef ref) {
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

  // Calculate the correct answer
  final correctAnswer = (num1 + num2).toString();

  // Generate three other believable incorrect answers using maxNumber
  List<String> answerChoices = [];
  while (answerChoices.length < 3) {
    final incorrectAnswer = (int.parse(correctAnswer) + random.nextInt(maxNumber)).toString();
    if (incorrectAnswer != correctAnswer && !answerChoices.contains(incorrectAnswer)) {
      answerChoices.add(incorrectAnswer);
    }
  }

  // Shuffle the answer choices
  answerChoices..add(correctAnswer)..shuffle();

  // Create the question
  final question = '$num1 + $num2 = ?';

  return AdditionQuestion(
    question: question,
    answerChoices: answerChoices,
    correctAnswer: correctAnswer,
  );
}