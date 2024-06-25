/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (questions_page.dart) Last Modified on 6/24/24, 12:59 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/question_page/repository/submit_points.dart';

import '../../../../generated/l10n.dart';
import '../../../app.dart';
import '../domain/questions_notifier.dart';

final selectedAnswerProvider = StateProvider<String?>((ref) => null);

class QuestionsPage extends ConsumerStatefulWidget {
  final String gameCode;

  const QuestionsPage({Key? key, required this.gameCode}) : super(key: key);

  @override
  ConsumerState<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends ConsumerState<QuestionsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(questionsProvider.notifier).generateQuestions(totalQuestions: 100, ref: ref);
      ref.read(countdownProvider.notifier); // Start the countdown
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(questionsProvider);
    final currentQuestionIndex = ref.watch(currentQuestionIndexProvider);
    final remainingTime = ref.watch(countdownProvider);
    final isTimerComplete = ref.watch(timerCompleteProvider);
    final points = ref.watch(playerPointsProvider);
    final playerID = ref.read(playerIdProvider.notifier).state;

    if (isTimerComplete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(S.of(context).timesUp),
          content: Text("Total points: $points\nPress OK to submit"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
               context.go('/game/game_results/$points');
               submitPoints(widget.gameCode, points, playerID ?? 0);
              },
              child: const Text("Ok"),
            ),
          ],
        ));
       });
    }

    if (questions.isEmpty || currentQuestionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).noQuestionsAvailable),
        ),
        body: Center(
          child: Text(S.of(context).noQuestionsAvailable),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          var points = ref.watch(playerPointsProvider);
          return Text("${S.of(context).points} $points", style: const TextStyle(fontSize: 24));
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Answer Choices
            ...currentQuestion.answerChoices.map((answer) {
              final isCorrect = answer == currentQuestion.correctAnswer;
              return AnswerChoice(
                answer: answer,
                isCorrect: isCorrect,
                onTap: () {
                  // Update selected answer
                  ref.read(selectedAnswerProvider.notifier).state = answer;

                  // Check answer and update UI
                  ref.read(questionsProvider.notifier).checkAnswer(answer, ref, currentQuestion);

                  // Move to next question after a delay
                  Future.delayed(const Duration(seconds: 1), () {
                    ref.read(currentQuestionIndexProvider.notifier).state++;
                    ref.read(selectedAnswerProvider.notifier).state = null;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 16),

            // Remaining Time
            Text(
              S.of(context).timeRemainingRemainingtimeSeconds(remainingTime),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}



class AnswerChoice extends ConsumerWidget {
  final String answer;
  final VoidCallback onTap;
  final bool isCorrect;

  const AnswerChoice({
    Key? key,
    required this.answer,
    required this.onTap,
    required this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswer = ref.watch(selectedAnswerProvider);
    final isSelected = answer == selectedAnswer;

    Color backgroundColor;
    if (isSelected) {
      backgroundColor = isCorrect ? Colors.green : Colors.red;
    } else {
      backgroundColor = Colors.white;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            const Icon(Icons.circle_outlined),
            const SizedBox(width: 8.0),
            Expanded(child: Text(answer)),
          ],
        ),
      ),
    );
  }
}
