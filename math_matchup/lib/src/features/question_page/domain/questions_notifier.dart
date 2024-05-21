

/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (questions_notifier.dart) Last Modified on 8/24/23, 2:18 PM
 *
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/app.dart';
import 'package:math_matchup/src/utils/alert_dialogs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../presentation/questions_page.dart';

import '../data/addition_question.dart';

final questionsProvider = StateNotifierProvider<QuestionsNotifier, List<AdditionQuestion>>((ref) => QuestionsNotifier());
final playerPointsProvider = StateProvider<int>((ref) => 0);
final timerCompleteProvider = StateProvider<bool>((ref) => false);

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

final remainingTimeProvider = StateProvider<int>((ref) => 30);

class CountdownNotifier extends StateNotifier<int> {
  CountdownNotifier(int remainingTime, this.ref) : super(remainingTime) {
    _startTimer();
  }

  final StateNotifierProviderRef<CountdownNotifier, int> ref;
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
  return CountdownNotifier(30, ref); // 5 minutes in seconds
});

class QuestionsNotifier extends StateNotifier<List<AdditionQuestion>> {
  QuestionsNotifier() : super([]);

  void generateQuestions({required int totalQuestions}) {
    final questions = List.generate(totalQuestions, (_) => generateAdditionQuestion());
    state = questions;
  }

  void incrementPlayerPoints(int amount, WidgetRef ref) {
    ref.read(playerPointsProvider.notifier).state += amount;
  }

  void checkAnswer(String selectedAnswer, WidgetRef ref, AdditionQuestion currentQuestion) {
    var currentQuestionIndex = ref.read(currentQuestionIndexProvider);
    if (currentQuestion.correctAnswer == selectedAnswer) {
      incrementPlayerPoints(50, ref);
    } else {
      // Handle incorrect answer
    }

    // Notify listeners about the state change
    state = [...state];
  }
}


