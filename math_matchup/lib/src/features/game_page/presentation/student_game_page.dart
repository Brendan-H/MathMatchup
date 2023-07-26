import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/common_widgets/drawer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/constants.dart';
import '../../homescreen/presentation/homescreen.dart';
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
    } catch (e) {
      print("Error fetching game status: $e");
      throw e;
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
            loading: () => Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ],
      ),
      // floatingActionButton: gameStatus == GameStatus.ACTIVE
      //     ? FloatingActionButton(
      //   onPressed: () {
      //     // Navigate to the new page when the game status is "ACTIVE"
      //     context.go('/game/${widget.gameCode}/play');
      //   },
      //   child: Icon(Icons.play_arrow),
      // )
      //     : FloatingActionButton(
      //   onPressed: () {
      //     ref.refresh(gameStatusProvider); // Retry fetching the game status.
      //   },
      //   child: Icon(Icons.play_arrow),
      // ),
    );
  }
}