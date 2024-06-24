/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (addition_question.dart) Last Modified on 5/24/24, 5:05 PM
 *
 */

import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final difficulty = ref.read(diffucultyProvider.notifier).state;
  final digitsPerNumber = difficulty == "easy" ? 1 :
         difficulty == "medium" ? 2 :
         difficulty == "hard" ? 3 :
         difficulty == "impossible" ? 4
           : 1; //default to easy
  int maxNumber = 10;
  final random = Random();

  // Generate two random numbers
  final num1 = random.nextInt(pow(10, digitsPerNumber).toInt());
  final num2 = random.nextInt(pow(10, digitsPerNumber).toInt());

  // Calculate the correct answer
  final correctAnswer = (num1 + num2).toString();

  // Generate three other believable incorrect answers
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