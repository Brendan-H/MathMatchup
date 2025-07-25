/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (teacher_countdown_notifier.dart) Last Modified on 5/1/25, 11:43 PM
 *
 */

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../game_settings_page/presentation/game_settings_page.dart';

final remainingTimeProvider = StateProvider<int>((ref) => 30);
final teacherTimerCompleteProvider = StateProvider<bool>((ref) => false);

/// Simple timer for the big countdown timer displayed on the teacher's screen
class TeacherCountdownNotifier extends StateNotifier<int> {
  TeacherCountdownNotifier(super.remainingTime, this.ref) {
    _startTimer();
  }

  final StateNotifierProviderRef<TeacherCountdownNotifier, int> ref;
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
    ref.read(teacherTimerCompleteProvider.notifier).state = true;
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
final teacherCountdownProvider = StateNotifierProvider<TeacherCountdownNotifier, int>((ref) {
  final timeLimit = int.parse(ref.read(timeLimitProvider.notifier).state ?? '30');
  return TeacherCountdownNotifier(timeLimit, ref);
});