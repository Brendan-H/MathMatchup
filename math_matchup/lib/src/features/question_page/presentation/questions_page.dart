import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/addition_question.dart';
import '../domain/questions_notifier.dart';

class QuestionsPage extends ConsumerStatefulWidget {
  final String gameCode;
  final int totalDurationInSeconds = 300; // 5 minutes in seconds

  QuestionsPage({Key? key, required this.gameCode}) : super(key: key);

  @override
  ConsumerState<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends ConsumerState<QuestionsPage> {
  late int currentQuestionIndex;

  @override
  void initState() {
    super.initState();
    currentQuestionIndex = 0;
    Future.delayed(Duration.zero, () {
      ref.read(questionsProvider.notifier).generateQuestions(totalQuestions: 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(questionsProvider);
    final currentQuestion = questions[currentQuestionIndex];
    final remainingTime = ref.watch(remainingTimeProvider);
    final selectedAnswerProvider = StateProvider<String?>((ref) => null);


    return Scaffold(
      appBar: AppBar(
        title: Text('Questions Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question
            Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Answer Choices
            ...ref.watch(currentQuestionProvider).answerChoices.map((answer) {
              final isCorrect = answer == ref.watch(currentQuestionProvider).correctAnswer;
              final isSelected = answer == ref.watch(selectedAnswerProvider);
              return AnswerChoice(
                answer: answer,
                isCorrect: isCorrect,
                isSelected: isSelected,
                onTap: () {
                  ref.read(selectedAnswerProvider.notifier).state = answer;
                  Future.delayed(Duration.zero, () {
                    ref.read(questionsProvider.notifier).checkAnswer(answer);
                  });
                },
              );
            }),
            SizedBox(height: 16),

            // Remaining Time
            Text(
              'Time Remaining: $remainingTime seconds',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerChoice extends StatelessWidget {
  final String answer;
  final VoidCallback onTap;
  final bool isCorrect;
  final bool isSelected;

  const AnswerChoice({Key? key, required this.answer, required this.onTap, required this.isCorrect, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? (isCorrect ? Colors.green : Colors.red) : null,
        ),
        child: Row(
          children: [
            Icon(Icons.circle_outlined),
            SizedBox(width: 8.0),
            Expanded(child: Text(answer)),
          ],
        ),
      ),
    );
  }
}