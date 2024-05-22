/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (teacher_countdown.dart) Last Modified on 5/21/24, 7:01 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/teacher_countdown/domain/teacher_countdown_notifier.dart';


class TeacherCountdown extends ConsumerStatefulWidget {
  final String gameCode;
  const TeacherCountdown({super.key, required this.gameCode});

  @override
  ConsumerState createState() => _TeacherCountdownState();
}

class _TeacherCountdownState extends ConsumerState<TeacherCountdown> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(teacherCountdownProvider.notifier); // Start the countdown
    });
  }

  @override
  Widget build(BuildContext context) {
    final remainingTime = ref.watch(teacherCountdownProvider);
    final isTimerComplete = ref.watch(teacherTimerCompleteProvider);
    if (isTimerComplete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text("Time's Up!"),
          content: const Text("Wait for your students to finish the game and press the OK button before you continue or their scores will not be counted"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
                context.go('/game/scoring_page/${widget.gameCode}');
              },
              child: Text("Continue"),
            ),
          ],
        ));
      });
    }



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gameCode),
      ),
      body: Center(
        child: Text(remainingTime.toString(), style: const TextStyle(fontSize: 150)),
      ),
    );
  }
}
