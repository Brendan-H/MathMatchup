
/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (create_game.dart) Last Modified on 7/20/25, 1:37 PM
 *
 */

import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matchup_core/matchup_core.dart';
import '../../../utils/constants.dart';

/// Creates the game with the given settings and navigates to the [TeacherGamePage] with the game code.
void createGame(BuildContext context, String difficulty, String questionType, int timeLimit) async {
  final String backendurl = Constants.backendurl;
  final Dio dio = Dio();
  print("$backendurl/games");
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));


  try {
    final response = await dio.post(
      "$backendurl/games",
    data: {
        "difficulty": difficulty,
        "gameType": questionType,
        "timer": timeLimit,
    }
    );
    if (response.statusCode == 200) {
      print("Game created");
      final String gamecode = response.data['gameCode'];
      await FirebaseAnalytics.instance.logEvent(
        name: 'game_created',
        parameters: {
          'game_code': gamecode,
          'difficulty': difficulty,
          'question_type': questionType,
          'time_limit': timeLimit,
        },
      );
      context.go('/teacher_game_page/$gamecode');
    } else {
      // Handle other status codes if needed
      showAlertDialog(
        context: context,
        title: "Error creating game",
        defaultActionText: 'An error occurred. Please try again.',
      );
    }
  } on DioException catch (e) {
    // Handle Dio specific errors
    if (e.response != null) {
      // DioError with a response from the server
      showExceptionAlertDialog(
        context: context,
        title: "Error creating game",
        exception: e,
      );
    } else {
      // DioError without a response from the server
      showExceptionAlertDialog(
        context: context,
        title: "Error creating game",
        exception: e,
      );
    }
  } catch (e) {
    // Handle other general exceptions
    showExceptionAlertDialog(
      context: context,
      title: "Error creating game",
      exception: e,
    );
  }
}