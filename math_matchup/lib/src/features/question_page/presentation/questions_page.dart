import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/questions_notifier.dart';

final selectedAnswerProvider = StateProvider<String?>((ref) => null);

class QuestionsPage extends ConsumerStatefulWidget {
  final String gameCode;
  final int totalDurationInSeconds = 30; // 1 minute in seconds

  const QuestionsPage({Key? key, required this.gameCode}) : super(key: key);

  @override
  ConsumerState<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends ConsumerState<QuestionsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(questionsProvider.notifier).generateQuestions(totalQuestions: 100);
      ref.read(countdownProvider.notifier); // Start the countdown
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(questionsProvider);
    final currentQuestionIndex = ref.watch(currentQuestionIndexProvider);
    final remainingTime = ref.watch(countdownProvider); // Watch the countdown timer

    if (questions.isEmpty || currentQuestionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text("No Questions Available"),
        ),
        body: Center(
          child: Text("No questions available"),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          var points = ref.watch(playerPointsProvider);
          return Text("Points: $points", style: TextStyle(fontSize: 24));
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
                  Future.delayed(Duration(seconds: 1), () {
                    ref.read(currentQuestionIndexProvider.notifier).state++;
                    ref.read(selectedAnswerProvider.notifier).state = null;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 16),

            // Remaining Time
            Text(
              'Time Remaining: $remainingTime seconds',
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
