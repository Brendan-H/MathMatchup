/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (student_game_page.dart) Last Modified on 6/24/24, 12:59 PM
 *
 */

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants.dart';
import '../repository/get_names.dart';


enum GameStatus {
  WAITING_FOR_PLAYERS,
  ACTIVE,
  FINISHED,
  DEACTIVATED,
}

class GameStatusNotifier extends StateNotifier<GameStatus> {
  final String gameCode;
  final Dio dio = Dio();

  GameStatusNotifier(this.gameCode) : super(GameStatus.WAITING_FOR_PLAYERS);

  void fetchGameStatus() async {
    final baseurl = Constants.backendurl;
    try {
      print("$baseurl/games/$gameCode/status");
      final response = await dio.get("$baseurl/games/$gameCode/status");
      final gameStatusString = response.data as String;
      final gameStatus = parseGameStatus(gameStatusString);
      print("Game Status: $gameStatus");
      state = gameStatus;
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      print("Error fetching game status: $e");
      rethrow;
    }
  }

  GameStatus parseGameStatus(String status) {
    switch (status) {
      case "WAITING_FOR_PLAYERS":
        return GameStatus.WAITING_FOR_PLAYERS;
      case "ACTIVE":
        return GameStatus.ACTIVE;
      case "FINISHED":
        return GameStatus.FINISHED;
      case "DEACTIVATED":
        return GameStatus.DEACTIVATED;
      default:
        throw Exception("Unknown game status: $status");
    }
  }
}

class GamePage extends ConsumerStatefulWidget {
  final String gameCode;

  const GamePage({Key? key, required this.gameCode}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gameStatusProvider =
    StateNotifierProvider.autoDispose<GameStatusNotifier, GameStatus>((ref) {
      // final gameCode = ref.watch(gameCodeProvider.notifier).state;
      final notifier = GameStatusNotifier(widget.gameCode);
      notifier.fetchGameStatus(); // Fetch the game status when the provider is accessed
      return notifier;
    });

    final playersAsyncValue = ref.watch(playersStreamProvider(widget.gameCode));
    final gameStatus = ref.watch(gameStatusProvider);
    ref.listen<GameStatus>(gameStatusProvider, (previous, current) {
      if (current == GameStatus.ACTIVE) {
        // Navigate to the new page when the game status is "ACTIVE"
        context.go('/game/${widget.gameCode}/play');
      }
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(widget.gameCode),
      ),
      body: Column(
        children: [
          playersAsyncValue.when(
            data: (players) {
              return Expanded(
                child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(players[index]),
                    );
                  },
                ),
              );
            },
            loading: () => const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}