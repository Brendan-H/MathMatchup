/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (teacher_countdown.dart) Last Modified on 5/21/24, 4:07 PM
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
  Widget build(BuildContext context) {
    final remainingTime = ref.watch(teacherCountdownProvider);
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
