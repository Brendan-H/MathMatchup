/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (class_analytics.dart) Last Modified on 3/30/25, 7:57 PM
 *
 */


import 'package:dio/dio.dart';

import '../../../utils/constants.dart';

Future<GameAnalyticsDTO> getClassAnalytics(String gamecode) async {
  final dio = Dio();
  var baseurl = Constants.backendurl;

  var response = await dio.get("$baseurl/games/analytics/$gamecode");
  GameAnalyticsDTO gameAnalyticsDTO = GameAnalyticsDTO.fromJson(response.data);

  return gameAnalyticsDTO;
}


class GameAnalyticsDTO {
  final int totalQuestions;
  final int totalCorrect;
  final int totalIncorrect;
  final int totalPoints;
  final List<PlayerAnalytics> playerAnalyticsList;

  GameAnalyticsDTO({
    required this.totalQuestions,
    required this.totalCorrect,
    required this.totalIncorrect,
    required this.totalPoints,
    required this.playerAnalyticsList,
  });

  factory GameAnalyticsDTO.fromJson(Map<String, dynamic> json) {
    var list = json['playerAnalyticsList'] as List;
    List<PlayerAnalytics> playerList = list.map((i) => PlayerAnalytics.fromJson(i)).toList();

    return GameAnalyticsDTO(
      totalQuestions: json['totalQuestions'],
      totalCorrect: json['totalCorrect'],
      totalIncorrect: json['totalIncorrect'],
      totalPoints: json['totalPoints'],
      playerAnalyticsList: playerList,
    );
  }
}


class PlayerAnalytics {
  final int totalQuestions;
  final int totalCorrect;
  final int totalIncorrect;
  final double averageTime;
  final double accuracy;
  final double points;
  final int playerId;
  final String playerName;

  PlayerAnalytics({
    required this.totalQuestions,
    required this.totalCorrect,
    required this.totalIncorrect,
    required this.averageTime,
    required this.accuracy,
    required this.points,
    required this.playerId,
    required this.playerName,
  });

  factory PlayerAnalytics.fromJson(Map<String, dynamic> json) {
    return PlayerAnalytics(
      totalQuestions: json['totalQuestions'],
      totalCorrect: json['totalCorrect'],
      totalIncorrect: json['totalIncorrect'],
      averageTime: json['averageTime'],
      accuracy: json['accuracy'],
      points: json['points'],
      playerId: json['playerId'],
      playerName: json['playerName'],
    );
  }
}


/*
{
    "averageCorrect": 8.07,
    "totalCorrect": 242,
    "averageScore": 188.3,
    "averageTime": 3.36,
    "averageIncorrect": 7.0,
    "totalIncorrect": 210,
    "totalPoints": 5649,
    "totalAccuracy": 53.13,
    "totalQuestions": 452,
    "playerAnalyticsList": [
        {
            "totalCorrect": 13,
            "totalIncorrect": 2,
            "totalQuestions": 15,
            "averageTime": 1.22,
            "accuracy": 86.67,
            "points": 212.0,
            "playerId": 62,
            "playerName": "TestPlayer2"
        },
        {
            "totalCorrect": 11,
            "totalIncorrect": 10,
            "totalQuestions": 21,
            "averageTime": 5.26,
            "accuracy": 52.38,
            "points": 163.0,
            "playerId": 75,
            "playerName": "TestPlayer15"
        },
        {
            "totalCorrect": 4,
            "totalIncorrect": 2,
            "totalQuestions": 6,
            "averageTime": 0.22,
            "accuracy": 66.67,
            "points": 93.0,
            "playerId": 61,
            "playerName": "TestPlayer1"
        },
        {
            "totalCorrect": 1,
            "totalIncorrect": 5,
            "totalQuestions": 6,
            "averageTime": 1.82,
            "accuracy": 16.67,
            "points": 60.0,
            "playerId": 63,
            "playerName": "TestPlayer3"
        },
        {
            "totalCorrect": 9,
            "totalIncorrect": 2,
            "totalQuestions": 11,
            "averageTime": 5.9,
            "accuracy": 81.82,
            "points": 354.0,
            "playerId": 64,
            "playerName": "TestPlayer4"
        },
        {
            "totalCorrect": 13,
            "totalIncorrect": 7,
            "totalQuestions": 20,
            "averageTime": 4.82,
            "accuracy": 65.0,
            "points": 381.0,
            "playerId": 65,
            "playerName": "TestPlayer5"
        },
        {
            "totalCorrect": 6,
            "totalIncorrect": 4,
            "totalQuestions": 10,
            "averageTime": 3.43,
            "accuracy": 60.0,
            "points": 150.0,
            "playerId": 66,
            "playerName": "TestPlayer6"
        },
        {
            "totalCorrect": 7,
            "totalIncorrect": 6,
            "totalQuestions": 13,
            "averageTime": 5.65,
            "accuracy": 53.85,
            "points": 128.0,
            "playerId": 67,
            "playerName": "TestPlayer7"
        },
        {
            "totalCorrect": 6,
            "totalIncorrect": 5,
            "totalQuestions": 11,
            "averageTime": 5.08,
            "accuracy": 54.55,
            "points": 123.0,
            "playerId": 68,
            "playerName": "TestPlayer8"
        },
        {
            "totalCorrect": 2,
            "totalIncorrect": 15,
            "totalQuestions": 17,
            "averageTime": 2.65,
            "accuracy": 11.76,
            "points": 192.0,
            "playerId": 69,
            "playerName": "TestPlayer9"
        },
        {
            "totalCorrect": 15,
            "totalIncorrect": 14,
            "totalQuestions": 29,
            "averageTime": 0.95,
            "accuracy": 51.72,
            "points": 398.0,
            "playerId": 70,
            "playerName": "TestPlayer10"
        },
        {
            "totalCorrect": 15,
            "totalIncorrect": 2,
            "totalQuestions": 17,
            "averageTime": 2.79,
            "accuracy": 88.24,
            "points": 304.0,
            "playerId": 71,
            "playerName": "TestPlayer11"
        },
        {
            "totalCorrect": 6,
            "totalIncorrect": 8,
            "totalQuestions": 14,
            "averageTime": 4.04,
            "accuracy": 42.86,
            "points": 88.0,
            "playerId": 72,
            "playerName": "TestPlayer12"
        },
        {
            "totalCorrect": 4,
            "totalIncorrect": 6,
            "totalQuestions": 10,
            "averageTime": 4.17,
            "accuracy": 40.0,
            "points": 81.0,
            "playerId": 73,
            "playerName": "TestPlayer13"
        },
        {
            "totalCorrect": 12,
            "totalIncorrect": 15,
            "totalQuestions": 27,
            "averageTime": 4.88,
            "accuracy": 44.44,
            "points": 123.0,
            "playerId": 74,
            "playerName": "TestPlayer14"
        },
        {
            "totalCorrect": 11,
            "totalIncorrect": 14,
            "totalQuestions": 25,
            "averageTime": 0.48,
            "accuracy": 44.0,
            "points": 282.0,
            "playerId": 76,
            "playerName": "TestPlayer16"
        },
        {
            "totalCorrect": 12,
            "totalIncorrect": 1,
            "totalQuestions": 13,
            "averageTime": 3.08,
            "accuracy": 92.31,
            "points": 358.0,
            "playerId": 77,
            "playerName": "TestPlayer17"
        },
        {
            "totalCorrect": 4,
            "totalIncorrect": 9,
            "totalQuestions": 13,
            "averageTime": 4.74,
            "accuracy": 30.77,
            "points": 79.0,
            "playerId": 78,
            "playerName": "TestPlayer18"
        },
        {
            "totalCorrect": 14,
            "totalIncorrect": 3,
            "totalQuestions": 17,
            "averageTime": 2.82,
            "accuracy": 82.35,
            "points": 144.0,
            "playerId": 79,
            "playerName": "TestPlayer19"
        },
        {
            "totalCorrect": 4,
            "totalIncorrect": 8,
            "totalQuestions": 12,
            "averageTime": 0.42,
            "accuracy": 33.33,
            "points": 59.0,
            "playerId": 80,
            "playerName": "TestPlayer20"
        },
        {
            "totalCorrect": 7,
            "totalIncorrect": 12,
            "totalQuestions": 19,
            "averageTime": 5.24,
            "accuracy": 36.84,
            "points": 236.0,
            "playerId": 81,
            "playerName": "TestPlayer21"
        },
        {
            "totalCorrect": 3,
            "totalIncorrect": 2,
            "totalQuestions": 5,
            "averageTime": 3.87,
            "accuracy": 60.0,
            "points": 354.0,
            "playerId": 82,
            "playerName": "TestPlayer22"
        },
        {
            "totalCorrect": 10,
            "totalIncorrect": 12,
            "totalQuestions": 22,
            "averageTime": 4.83,
            "accuracy": 45.45,
            "points": 50.0,
            "playerId": 83,
            "playerName": "TestPlayer23"
        },
        {
            "totalCorrect": 14,
            "totalIncorrect": 11,
            "totalQuestions": 25,
            "averageTime": 4.97,
            "accuracy": 56.0,
            "points": 23.0,
            "playerId": 84,
            "playerName": "TestPlayer24"
        },
        {
            "totalCorrect": 4,
            "totalIncorrect": 5,
            "totalQuestions": 9,
            "averageTime": 5.97,
            "accuracy": 44.44,
            "points": 260.0,
            "playerId": 85,
            "playerName": "TestPlayer25"
        },
        {
            "totalCorrect": 3,
            "totalIncorrect": 3,
            "totalQuestions": 6,
            "averageTime": 2.13,
            "accuracy": 50.0,
            "points": 253.0,
            "playerId": 86,
            "playerName": "TestPlayer26"
        },
        {
            "totalCorrect": 9,
            "totalIncorrect": 4,
            "totalQuestions": 13,
            "averageTime": 1.93,
            "accuracy": 69.23,
            "points": 72.0,
            "playerId": 87,
            "playerName": "TestPlayer27"
        },
        {
            "totalCorrect": 2,
            "totalIncorrect": 6,
            "totalQuestions": 8,
            "averageTime": 0.63,
            "accuracy": 25.0,
            "points": 254.0,
            "playerId": 88,
            "playerName": "TestPlayer28"
        },
        {
            "totalCorrect": 14,
            "totalIncorrect": 9,
            "totalQuestions": 23,
            "averageTime": 0.84,
            "accuracy": 60.87,
            "points": 63.0,
            "playerId": 89,
            "playerName": "TestPlayer29"
        },
        {
            "totalCorrect": 7,
            "totalIncorrect": 8,
            "totalQuestions": 15,
            "averageTime": 5.84,
            "accuracy": 46.67,
            "points": 312.0,
            "playerId": 90,
            "playerName": "TestPlayer30"
        }
    ]
}
 */