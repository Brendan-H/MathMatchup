

/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (questions_notifier.dart) Last Modified on 7/27/23, 8:45 PM
 *
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../presentation/questions_page.dart';

import '../data/addition_question.dart';

final questionsProvider = StateNotifierProvider<QuestionsNotifier, List<AdditionQuestion>>((ref) => QuestionsNotifier());
final playerPointsProvider = StateProvider<int>((ref) => 0);

final currentQuestionIndexProvider = StateProvider<int>((ref) => 0);

final currentQuestionProvider = Provider<AdditionQuestion>((ref) {
  final questions = ref.watch(questionsProvider);
  final currentQuestionIndex = ref.watch(currentQuestionIndexProvider);
  return questions.isNotEmpty ? questions[currentQuestionIndex] : AdditionQuestion(
    question: 'No questions available',
    answerChoices: ['An error Occurred', 'hi', 'hello', 'hola'],
    correctAnswer: '',
  );
});


final remainingTimeProvider = Provider<int>((ref) => 300);
class QuestionsNotifier extends StateNotifier<List<AdditionQuestion>> {
  QuestionsNotifier() : super([]);

  void generateQuestions({required int totalQuestions}) {
    final questions = List.generate(totalQuestions, (_) => generateAdditionQuestion());
    state = questions;
  }


  final getCurrentQuestion = Provider<AdditionQuestion>((ref) {
    final questions = ref.watch(questionsProvider);
    final currentQuestionIndex = ref.watch(currentQuestionIndexProvider);
    return questions.isNotEmpty ? questions[currentQuestionIndex] : AdditionQuestion(
      question: 'No questions available',
      answerChoices: ['An error Occurred', 'hi', 'hello', 'hola'],
      correctAnswer: '',
    );
  });

  void incrementPlayerPoints(int amount, WidgetRef ref) {
       ref.read(playerPointsProvider.notifier).state += amount;
  }

  void checkAnswer(String selectedAnswer, WidgetRef ref, AdditionQuestion currentQuestion) {
    var currentQuestionIndex = ref.read(currentQuestionIndexProvider);
    if (currentQuestion.correctAnswer == selectedAnswer) {
      incrementPlayerPoints(50, ref);
      final correctAnswerIndex = currentQuestion.answerChoices.indexOf(currentQuestion.correctAnswer);
      state[currentQuestionIndex].answerChoices[correctAnswerIndex] = 'Correct!';
    } else {
      // Handle incorrect answer
    }

    // Move to the next question
    if (currentQuestionIndex < state.length - 1) {
      currentQuestionIndex++;
    } else {
      // No more questions, game over or generate new questions
    }

    // Notify listeners about the state change
    state = [...state];
  }
}