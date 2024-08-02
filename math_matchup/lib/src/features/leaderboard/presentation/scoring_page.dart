/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (scoring_page.dart) Last Modified on 6/25/24, 8:29 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../generated/l10n.dart';
import '../../../app.dart';
import '../domain/scoring_countdown_notifier.dart';
import '../repository/get_leaderboard.dart';

/// Page exists solely for suspense to build up before revealing the teammates and scores
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
    Future.delayed(Duration.zero, () {
      ref.read(scoringCountdownProvider.notifier); // Start the countdown
    });
    futureTeams = fetchLeaderboard(widget.gameCode);
    futureTeams.then((teams) {
      ref.read(leaderboardProvider.notifier).state = teams;
      print(teams);
    });
  }

  @override
  Widget build(BuildContext context) {
    final remainingTime = ref.watch(scoringCountdownProvider);
    final isTimerComplete = ref.watch(scoringTimerCompleteProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(S.of(context).whoWillYourTeammateBeYoullFindOutInRemainingtime(remainingTime), style: Theme.of(context).textTheme.headlineLarge),
          FutureBuilder<List<Team>>(
            future: futureTeams,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Future.delayed(const Duration(seconds: 10), () {
                    context.go('/game/leaderboard/${widget.gameCode}');
                  });
                });
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}