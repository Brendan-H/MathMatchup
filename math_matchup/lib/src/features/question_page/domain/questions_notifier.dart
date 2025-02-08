

/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (questions_notifier.dart) Last Modified on 1/25/25, 9:25 PM
 *
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/features/question_page/domain/question_timer.dart';

import '../../game_settings_page/presentation/game_settings_page.dart';
import '../data/question.dart';
import '../presentation/questions_page.dart';
import '../repository/question_type_switcher.dart';

final questionsProvider = StateNotifierProvider<QuestionsNotifier, List<Question>>((ref) => QuestionsNotifier());
final playerPointsProvider = StateProvider<int>((ref) => 0);
final timerCompleteProvider = StateProvider<bool>((ref) => false);

final currentQuestionIndexProvider = StateProvider<int>((ref) => 0);

final currentQuestionProvider = Provider<Question>((ref) {
  final questions = ref.watch(questionsProvider);
  final currentQuestionIndex = ref.watch(currentQuestionIndexProvider);

  return questions.isNotEmpty ? questions[currentQuestionIndex] : Question(
    question: 'No questions available',
    answerChoices: ['An error Occurred', 'hi', 'hello', 'hola'],
    correctAnswer: '',
  );
});

/// Timer displayed to the user based on the limit set by the teacher
class CountdownNotifier extends StateNotifier<int> {
  CountdownNotifier(int remainingTime, this.ref) : super(remainingTime) {
    _startTimer();
  }

  final StateNotifierProviderRef<CountdownNotifier, int> ref;
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        timer.cancel();
        _onTimerComplete();
      }
    });
  }

  void _onTimerComplete() {
    ref.read(timerCompleteProvider.notifier).state = true;
    final points = ref.read(playerPointsProvider);
    print("\n\n\n\n Timer Complete. Points: $points \n\n\n\n");
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final countdownProvider = StateNotifierProvider<CountdownNotifier, int>((ref) {
  final timeLimit = int.parse(ref.read(timeLimitProvider.notifier).state ?? '60');
  return CountdownNotifier(timeLimit, ref);
});

final isAnsweringProvider = StateProvider<bool>((ref) => false);

/// Gets the selected answer that the user clicks while also providing short delays and incorrect answer penalties so the user cannot rush through
class QuestionsNotifier extends StateNotifier<List<Question>> {
  QuestionsNotifier() : super([]);
  void generateQuestions({required int totalQuestions, required WidgetRef ref}) {
    final questions = List.generate(totalQuestions, (_) => generateQuestion(ref));
    state = questions;
  }

  void incrementPlayerPoints(int amount, WidgetRef ref) {
    ref.read(playerPointsProvider.notifier).state += amount;
  }
 /// Checks if the answer is right or wrong and increments the player's points accordingly
 void checkAnswer(String selectedAnswer, WidgetRef ref, Question currentQuestion, BuildContext context) {
  var currentQuestionIndex = ref.read(currentQuestionIndexProvider);
  if (ref.read(isAnsweringProvider.notifier).state) {
    return;
  }

  ref.read(isAnsweringProvider.notifier).state = true; // Set isAnswering to true

  if (currentQuestion.correctAnswer == selectedAnswer) {
    incrementPlayerPoints(50, ref);
    // Delay moving to the next question by 1 second
    Future.delayed(const Duration(seconds: 1), () {
      ref.read(currentQuestionIndexProvider.notifier).state++;
      ref.read(selectedAnswerProvider.notifier).state = null;
      ref.read(isAnsweringProvider.notifier).state = false; // Set isAnswering to false
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Correct!'), duration: Duration(seconds: 1),));
  } else {
    // Delay moving to the next question by 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      ref.read(currentQuestionIndexProvider.notifier).state++;
      ref.read(selectedAnswerProvider.notifier).state = null;
      ref.read(isAnsweringProvider.notifier).state = false; // Set isAnswering to false
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incorrect! Waiting for 3 seconds...'), duration: Duration(seconds: 3),));
  }

  // Notify listeners about the state change
  state = [...state];
}
}


