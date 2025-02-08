/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (question_timer.dart) Last Modified on 2/5/25, 10:42 PM
 *
 */
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionTimeProvider = StateProvider<Map<int, Duration>>((ref) => {});

class QuestionTimer {
  final Stopwatch _stopwatch = Stopwatch();
  final WidgetRef ref;

  QuestionTimer(this.ref);

  void start() {
    reset();
    _stopwatch.start();
  }

  void reset() {
    _stopwatch.reset();
  }

  void dispose() {
    _stopwatch.stop();
  }

  Duration? stop(int questionIndex) {
    _stopwatch.stop();
    final time = _stopwatch.elapsed;
    ref.read(questionTimeProvider.notifier).update((state) {
      final newMap = Map<int, Duration>.from(state);
      newMap[questionIndex] = time;
      return newMap;
    });
    return time;
  }

}
