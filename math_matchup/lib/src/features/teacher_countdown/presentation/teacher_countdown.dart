/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (teacher_countdown.dart) Last Modified on 1/25/25, 9:25 PM
 *
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/teacher_countdown/domain/teacher_countdown_notifier.dart';

import '../../../../generated/l10n.dart';
import '../../../utils/constants.dart';

/// Screen that displays the countdown timer for the teacher. Meant to be projected to the class.
class TeacherCountdown extends ConsumerStatefulWidget {
  final String gameCode;
  const TeacherCountdown({super.key, required this.gameCode});

  @override
  ConsumerState createState() => _TeacherCountdownState();
}

class _TeacherCountdownState extends ConsumerState<TeacherCountdown> {
  final backendUrl = Constants.backendurl;

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
          title: Text(S.of(context).timesUp),
          content: Text(S.of(context).waitForYourStudentsToFinish),
          actions: [
            TextButton(
              onPressed: () async{
                await Dio().post('$backendUrl/games/finish?gameCode=${widget.gameCode}');
                context.pop();
                print("COUNTDOWN GAMECODE: ${widget.gameCode}");
                context.go('/game/scoring_page/${widget.gameCode}');
              },
              child: Text(S.of(context).continueText),
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
