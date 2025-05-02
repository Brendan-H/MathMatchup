/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (Member.dart) Last Modified on 1/26/25, 3:56 PM
 *
 */

/// Class to represent a member of a team
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