/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (join_game.dart) Last Modified on 5/21/24, 4:33 PM
 *
 */

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/utils/alert_dialogs.dart';
import 'package:math_matchup/src/utils/constants.dart';
import 'package:math_matchup/src/app.dart';


void joinGame(String gamecode, String name, BuildContext context, WidgetRef ref) async {
  var backendurl = Constants.backendurl;
  var dio = Dio();
  print("$backendurl/players/create?gameCode=${gamecode.toString()}");

  try {
    final response = await dio.post(
      "$backendurl/players/create",
      queryParameters: {
        "gameCode": gamecode,
      },
      data: {
        "name": name,
      },
    );

    if (response.statusCode == 200) {
      print("game joined");
      var playerID = response.data['id'];
      ref.read(playerIdProvider.notifier).state = playerID;
      context.go('/student_game_page/$gamecode');
    } else {
      // Handle other status codes if needed
      showAlertDialog(
        context: context,
        title: "Error joining game",
        defaultActionText: 'An error occurred. Please try again.'
      );
    }
  } on DioException catch (e) {
    // Handle Dio specific errors
    if (e.response != null) {
      // DioError with a response from the server
      showExceptionAlertDialog(
        context: context,
        title: "Error joining game",
        exception: e
      );
    } else {
      // DioError without a response from the server
      showExceptionAlertDialog(
        context: context,
        title: "Error joining game", exception: e,

      );
    }
  } on Exception catch (e) {
    // Handle other general exceptions
    showExceptionAlertDialog(
      context: context,
      title: "Error joining game",
      exception: e,
    );
  }
}