/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (get_leaderboard.dart) Last Modified on 5/21/24, 7:10 PM
 *
 */

/* [
    {
        "id": {
            "gameId": 28,
            "teamId": 12
        },
        "members": [
            {
                "id": 188,
                "name": "Test student 1",
                "points": 0
            },
            {
                "id": 192,
                "name": "Brendan",
                "points": 0
            }
        ],
        "points": 0
    },
    {
        "id": {
            "gameId": 28,
            "teamId": 13
        },
        "members": [
            {
                "id": 189,
                "name": "Test student 2",
                "points": 0
            },
            {
                "id": 190,
                "name": "Test student 3",
                "points": 0
            }
        ],
        "points": 0
    },
    {
        "id": {
            "gameId": 28,
            "teamId": 14
        },
        "members": [
            {
                "id": 187,
                "name": "Test student",
                "points": 0
            },
            {
                "id": 191,
                "name": "Test student 4",
                "points": 0
            }
        ],
        "points": 0
    }
] */
import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../utils/constants.dart';


class Member {
  final int id;
  final String name;
  final int points;

  Member({required this.id, required this.name, required this.points});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      points: json['points'],
    );
  }
  @override
  String toString() {
    return 'Member{id: $id, name: $name, points: $points}';
  }
}

class Team {
  final int gameId;
  final int teamId;
  final List<Member> members;
  final int points;

  Team({required this.gameId, required this.teamId, required this.members, required this.points});

  factory Team.fromJson(Map<String, dynamic> json) {
    var membersJson = json['members'] as List;
    List<Member> membersList = membersJson.map((i) => Member.fromJson(i)).toList();

    return Team(
      gameId: json['id']['gameId'],
      teamId: json['id']['teamId'],
      members: membersList,
      points: json['points'],
    );
  }
  @override
  String toString() {
    return 'Team{gameId: $gameId, teamId: $teamId, members: $members, points: $points}';
  }
}

Future<List<Team>> fetchLeaderboard(String gameCode) async {
  final String backendUrl = Constants.backendurl;
  final response = await Dio().get('$backendUrl/leaderboard/game/$gameCode');

  if (response.statusCode == 200) {
    List jsonResponse = response.data;
    Future.delayed(Duration(seconds: 3));
    return jsonResponse.map((team) => Team.fromJson(team)).toList();
  } else {
    throw Exception('Failed to load leaderboard from API');
  }
}