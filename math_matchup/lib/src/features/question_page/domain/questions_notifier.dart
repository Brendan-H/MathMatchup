

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/addition_question.dart';

final questionsProvider = StateNotifierProvider<QuestionsNotifier, List<AdditionQuestion>>((ref) => QuestionsNotifier());

final currentQuestionProvider = Provider<AdditionQuestion>((ref) {
  final questions = ref.watch(questionsProvider);
  final currentQuestionIndex = ref.watch(currentQuestionIndexProvider);
  return questions.isNotEmpty ? questions[currentQuestionIndex] : AdditionQuestion(
    question: 'No questions available',
    answerChoices: ['An error Occurred', 'hi', 'hello', 'hola'],
    correctAnswer: '',
  );
});

final currentQuestionIndexProvider = Provider<int>((ref) => ref.watch(questionsProvider.notifier).currentQuestionIndex);

final remainingTimeProvider = Provider<int>((ref) => 300);
class QuestionsNotifier extends StateNotifier<List<AdditionQuestion>> {
  QuestionsNotifier() : super([]);

  void generateQuestions({required int totalQuestions}) {
    final questions = List.generate(totalQuestions, (_) => generateAdditionQuestion());
    state = questions;
  }

  int currentQuestionIndex = 0;

  AdditionQuestion get currentQuestion =>
      state.isNotEmpty ? state[currentQuestionIndex] : AdditionQuestion(
        question: 'No questions available',
        answerChoices: [],
        correctAnswer: '',
      );

  void checkAnswer(String selectedAnswer) {
    if (currentQuestion.correctAnswer == selectedAnswer) {
      // Handle correct answer
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