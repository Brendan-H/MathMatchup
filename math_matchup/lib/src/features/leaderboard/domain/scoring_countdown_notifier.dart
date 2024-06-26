/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (scoring_countdown_notifier.dart) Last Modified on 6/24/24, 9:42 PM
 *
 */

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Simple timer that counts down from 10 to 0 to add suspense to the scoring and teammate reveal
final remainingTimeProvider = StateProvider<int>((ref) => 10);
final scoringTimerCompleteProvider = StateProvider<bool>((ref) => false);

class ScoringCountdownNotifier extends StateNotifier<int> {
  ScoringCountdownNotifier(int remainingTime, this.ref) : super(remainingTime) {
    _startTimer();
  }

  final StateNotifierProviderRef<ScoringCountdownNotifier, int> ref;
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
    ref.read(scoringTimerCompleteProvider.notifier).state = true;
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final scoringCountdownProvider = StateNotifierProvider<ScoringCountdownNotifier, int>((ref) {
  return ScoringCountdownNotifier(10, ref);
});