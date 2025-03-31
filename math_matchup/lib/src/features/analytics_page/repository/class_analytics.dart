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