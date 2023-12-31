/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (start_game.dart) Last Modified on 7/26/23, 12:20 PM
 *
 */

import 'package:dio/dio.dart';

import '../../../utils/constants.dart';

Future<void> startGame(String gameCode) async {
  var backendUrl = Constants.backendurl;
  var dio = Dio();

  try {
    final response = await dio.post(
      "$backendUrl/games/start",
      queryParameters: {
        "gameCode": gameCode,
      },
    );

    if (response.statusCode == 200) {
      print("Game started successfully.");
    } else {
      // Handle other status codes if needed
      print("Failed to start the game: ${response.data}");
    }
  } on DioException catch (e) {
    // Handle Dio specific errors
    if (e.response != null) {
      // DioError with a response from the server
      print("Failed to start the game: ${e.response?.data}");
    } else {
      // DioError without a response from the server
      print("Failed to start the game: ${e.message}");
    }
  } on Exception catch (e) {
    // Handle other general exceptions
    print("Failed to start the game: ${e.toString()}");
  }
}



