/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (Router.dart) Last Modified on 7/27/23, 3:47 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/game_page/presentation/student_game_page.dart';
import 'package:math_matchup/src/features/homescreen/presentation/homescreen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/game_page/presentation/teacher_game_page.dart';
import '../features/question_page/presentation/questions_page.dart';

part 'Router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef goRouterRef) {
  return GoRouter(
      routes: [
        GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return const MaterialPage(child: HomeScreen());
            }
        ),
        GoRoute(
          path: '/student_game_page/:gamecode',
          pageBuilder: (context, state) {
            final gameCode = state.pathParameters['gamecode'];
            return MaterialPage(
              child: GamePage(gameCode: gameCode ?? "123456"),
            );
          },
        ),
        GoRoute(
          path: '/teacher_game_page/:gamecode',
          pageBuilder: (context, state) {
            final gameCode = state.pathParameters['gamecode'];
            return MaterialPage(
              child: TeacherGamePage(gameCode: gameCode ?? "123456"),
            );
          },
        ),
        GoRoute(
          path: '/game/:gamecode/play',
          pageBuilder: (context, state) {
            final gameCode = state.pathParameters['gamecode'];
            return MaterialPage(
              child: QuestionsPage(gameCode: gameCode ?? "123456"),
            );
          },
        ),
      ],
  );
}