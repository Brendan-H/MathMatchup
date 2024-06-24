
/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (create_game.dart) Last Modified on 5/21/24, 7:10 PM
 *
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/alert_dialogs.dart';
import '../../../utils/constants.dart';


void createGame(BuildContext context) async {
  final String backendurl = Constants.backendurl;
  final Dio dio = Dio();
  print("$backendurl/games");

  try {
    final response = await dio.post(
      "$backendurl/games",
    data: {}
    );
    if (response.statusCode == 200) {
      print("Game created");
      final String gamecode = response.data['gameCode'];
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