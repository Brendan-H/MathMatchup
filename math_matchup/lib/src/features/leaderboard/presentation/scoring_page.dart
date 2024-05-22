/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (scoring_page.dart) Last Modified on 5/21/24, 7:05 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app.dart';
import '../repository/get_leaderboard.dart';

class ScoringPage extends ConsumerStatefulWidget {
  const ScoringPage({Key? key, required this.gameCode}) : super(key: key);
  final String gameCode;

  @override
  ConsumerState createState() => _ScoringPageState();
}

class _ScoringPageState extends ConsumerState<ScoringPage> {
  late Future<List<Team>> futureTeams;

  @override
  void initState() {
    super.initState();
    futureTeams = fetchLeaderboard(widget.gameCode);
    futureTeams.then((teams) {
      ref.read(leaderboardProvider.notifier).state = teams;
      print(teams);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Team>>(
      future: futureTeams,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/game/leaderboard/${widget.gameCode}');
          });
          return Container();
        }
      },
    );
  }
}