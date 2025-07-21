/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (leaderboard_page.dart) Last Modified on 5/1/25, 11:43 PM
 *
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    final classAnalytics = ref.read(classAnalyticsProvider.notifier).state;
    final teams = ref.read(leaderboardProvider.notifier).state;
    teams?.sort((a, b) => b.points.compareTo(a.points)); // Sort teams by total points

    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard for ${widget.gameCode}'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          context.go('/game/analytics/${widget.gameCode}');
        },
        label: Text("View Analytics", style: TextStyle(fontSize: 16)),
      ),
      body: Column(
        children: [
          Text("Class Stats", style: TextStyle(fontSize: 30),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Table(
                border: TableBorder.symmetric(
                  inside: BorderSide(color: Colors.black),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      Center(child: Text('Total Questions')),
                      Center(child: Text('Correct')),
                      Center(child: Text('Incorrect')),
                      Center(child: Text('Points')),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(child: Text('${classAnalytics?.totalQuestions}')),
                      Center(child: Text('${classAnalytics?.totalCorrect}')),
                      Center(child: Text('${classAnalytics?.totalIncorrect}')),
                      Center(child: Text('${classAnalytics?.totalPoints}')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}