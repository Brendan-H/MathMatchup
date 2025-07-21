/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (submit_points_and_analytics.dart) Last Modified on 5/1/25, 11:43 PM
 *
 */

import 'package:dio/dio.dart';
import 'package:math_matchup/src/features/question_page/data/points_and_analytics.dart';
import '../../../utils/constants.dart';

/// Submits the player's points to the backend. Team scores are calculated on the backend.
Future<void> submitPointsAndAnalytics (PointsAndAnalytics p, int playerID, String gameCode) async {
  var backendUrl = Constants.backendurl;
  var dio = Dio();

  print("\n\n\n\n URL: \n $backendUrl/players/submit-points/?playerID=$playerID/");

  try {
    print("\n\n\n playerid: $playerID\n\n\n");
    print("\n\n\n gamecode: $gameCode\n\n\n");
    print("\n\n\nPoints: ${p.points}");
    final response = await dio.post(
      "$backendUrl/players/submit-points",
      queryParameters: {
        "gameCode": gameCode,
        "playerID": playerID,
      },
      data: {
        "points": p.points ?? 0,
        "correctAnswers": p.correctAnswers ?? 1,
        "incorrectAnswers": p.incorrectAnswers ?? 1,
        "totalQuestions": p.totalQuestions ?? 2,
        "averageTime": p.averageTime ?? 3.5,
        "accuracy": p.accuracy ?? 50.0,
      },
    );

    if (response.statusCode == 200) {
      print("points submitted successfully for player $playerID.");
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