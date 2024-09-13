/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (leaderboard_page.dart) Last Modified on 9/13/24, 10:45 AM
 *
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';

/// Leaderboard page that displays the current standings of all teams in the game
class LeaderboardPage extends ConsumerStatefulWidget {
  const LeaderboardPage({super.key, required this.gameCode});
  final String gameCode;

  @override
  ConsumerState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends ConsumerState<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    final teams = ref.read(leaderboardProvider.notifier).state;
    teams?.sort((a, b) => b.points.compareTo(a.points)); // Sort teams by total points

    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard for ${widget.gameCode}'),
      ),
      body: ListView.builder(
        itemCount: teams?.length,
        itemBuilder: (context, index) {
          final team = teams?[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Team ${team?.teamId} - Total Points: ${team?.points}'),
                  for (var member in team!.members)
                    Text('Member: ${member.name} - Points: ${member.points}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}