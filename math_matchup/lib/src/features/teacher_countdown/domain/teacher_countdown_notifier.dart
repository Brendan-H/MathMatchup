/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (teacher_countdown_notifier.dart) Last Modified on 5/21/24, 4:59 PM
 *
 */

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final remainingTimeProvider = StateProvider<int>((ref) => 30);
final teacherTimerCompleteProvider = StateProvider<bool>((ref) => false);

class TeacherCountdownNotifier extends StateNotifier<int> {
  TeacherCountdownNotifier(int remainingTime, this.ref) : super(remainingTime) {
    _startTimer();
  }

  final StateNotifierProviderRef<TeacherCountdownNotifier, int> ref;
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
    ref.read(teacherTimerCompleteProvider.notifier).state = true;
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final teacherCountdownProvider = StateNotifierProvider<TeacherCountdownNotifier, int>((ref) {
  return TeacherCountdownNotifier(30, ref);
});