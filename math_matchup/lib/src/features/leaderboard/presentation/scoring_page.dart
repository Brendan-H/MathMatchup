/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (scoring_page.dart) Last Modified on 3/30/25, 9:49 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/analytics_page/repository/class_analytics.dart';
import '../../../../generated/l10n.dart';
import '../../../app.dart';
import '../domain/scoring_countdown_notifier.dart';
import '../repository/get_leaderboard.dart';

/// Page exists solely for suspense to build up before revealing the teammates and scores
class ScoringPage extends ConsumerStatefulWidget {
  const ScoringPage({super.key, required this.gameCode});
  final String gameCode;

  @override
  ConsumerState createState() => _ScoringPageState();
}

class _ScoringPageState extends ConsumerState<ScoringPage> {
  late Future<List<Team>> futureTeams;
  late Future<GameAnalyticsDTO> futureAnalytics;

  @override
  void initState() {
    print("SCORING PAGE GAMECODE: ${widget.gameCode}");
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(scoringCountdownProvider.notifier); // Start the countdown
    });
    futureTeams = fetchLeaderboard(widget.gameCode);
    futureAnalytics = getClassAnalytics(widget.gameCode);
    futureAnalytics.then((analytics) {
      ref.read(classAnalyticsProvider.notifier).state = analytics;
    });
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