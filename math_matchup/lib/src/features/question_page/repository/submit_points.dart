/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (submit_points.dart) Last Modified on 6/24/24, 12:59 PM
 *
 */

import 'package:dio/dio.dart';
import '../../../utils/constants.dart';

Future<void> submitPoints (String gameCode, int points, int playerID) async {
  var backendUrl = Constants.backendurl;
  var dio = Dio();

  print("\n\n\n\n URL: \n $backendUrl/players/$playerID/submit-points");

  try {
    print("\n\n\n playerid: $playerID\n\n\n");
    final response = await dio.post(
      "$backendUrl/players/$playerID/submit-points",
      queryParameters: {
        "gameCode": gameCode,
        "points": points,
      },
    );

    if (response.statusCode == 200) {
      print("$points points submitted successfully for player $playerID.");
    } else {
      // Handle other status codes if needed
      print("Error when submitting points: ${response.data}");
    }
  } on DioException catch (e) {
    // Handle Dio specific errors
    if (e.response != null) {
      // DioError with a response from the server
      print("Error when submitting points: ${e.response?.data}");
    } else {
      // DioError without a response from the server
      print("Error when submitting points: ${e.message}");
    }
  } on Exception catch (e) {
    // Handle other general exceptions
    print("Error when submitting points: ${e.toString()}");
  }

}