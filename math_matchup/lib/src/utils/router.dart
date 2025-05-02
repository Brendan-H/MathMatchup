/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (router.dart) Last Modified on 3/30/25, 9:53 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/analytics_page/presentation/analytics_page.dart';
import 'package:math_matchup/src/features/game_creation_homepage/presentation/game_creation_homepage.dart';
import 'package:math_matchup/src/features/game_page/presentation/student_game_page.dart';
import 'package:math_matchup/src/features/game_settings_page/presentation/game_settings_page.dart';
import 'package:math_matchup/src/features/homescreen/presentation/homescreen.dart';
import 'package:math_matchup/src/features/leaderboard/presentation/leaderboard_page.dart';
import 'package:math_matchup/src/features/login_page/presentation/password_reset_page.dart';
import 'package:math_matchup/src/features/login_page/presentation/teacher_login_page.dart';
import 'package:math_matchup/src/utils/page_not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/game_page/presentation/teacher_game_page.dart';
import '../features/leaderboard/presentation/scoring_page.dart';
import '../features/question_page/presentation/questions_page.dart';
import '../features/question_page/presentation/results_page.dart';
import '../features/teacher_countdown/presentation/teacher_countdown.dart';

part 'router.g.dart';

/// This is the main router for the app, used to navigate between screens. Can transfer data, if needed.
@riverpod
GoRouter goRouter(GoRouterRef goRouterRef) {
  return GoRouter(
      debugLogDiagnostics: true,
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
        GoRoute(
          path: '/teacher_countdown/:gamecode',
          pageBuilder: (context, state) {
            final gameCode = state.pathParameters['gamecode'];
            return MaterialPage(
              child: TeacherCountdown(gameCode: gameCode ?? "123456"),
            );
          },
        ),
        GoRoute(
          path: '/game/game_results/:points',
          pageBuilder: (context, state) {
            final gameCode = state.pathParameters['points'];
            return MaterialPage(
              child: ResultsPage(points: int.parse(gameCode ?? "0"))
            );
          },
        ),
        GoRoute(
          path: '/game/scoring_page/:gamecode',
          pageBuilder: (context, state) {
            final gameCode = state.pathParameters['gamecode'];
            return MaterialPage(
                child: ScoringPage(gameCode: gameCode ?? "123456")
            );
          },
        ),
        GoRoute(
          path: '/game/leaderboard/:gamecode',
          pageBuilder: (context, state) {
            final gameCode = state.pathParameters['gamecode'];
            return MaterialPage(
                child: LeaderboardPage(gameCode: gameCode ?? "123456")
            );
          },
        ),
        GoRoute(
          path: '/game/settings',
          pageBuilder: (context, state) {
            return const MaterialPage(
                child: GameSettingsPage()
            );
          },
        ),
        GoRoute(
          path: '/game/creation_homepage',
          pageBuilder: (context, state) {
            return const MaterialPage(
                child: GameCreationHomepage()
            );
          },
        ),
        GoRoute(
          path: '/teacher_login',
          pageBuilder: (context, state) {
            return const MaterialPage(
                child: TeacherLoginPage()
            );
          },
        ),
        GoRoute(
          path: '/teacher_login/password_reset',
          pageBuilder: (context, state) {
            return const MaterialPage(
                child: PasswordResetPage()
            );
          },
        ),
        GoRoute(
          path: '/game/analytics/:gamecode',
          pageBuilder: (context, state) {
            final gameCode = state.pathParameters['gamecode'];
            return MaterialPage(
                child: AnalyticsPage(gameCode: gameCode ?? "123456")
            );
          },
        ),
      ],
    errorBuilder: (context, state) => const PageNotFoundScreen(),
  );
}