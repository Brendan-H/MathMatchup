/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (question.dart) Last Modified on 6/26/24, 4:54 PM
 *
 */
/// Class to represent a question
class Question {
  String question;
  List<String> answerChoices;
  String correctAnswer;

  Question({
    required this.question,
    required this.answerChoices,
    required this.correctAnswer,
  });
}