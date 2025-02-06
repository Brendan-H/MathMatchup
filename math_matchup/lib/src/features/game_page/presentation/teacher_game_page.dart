

/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (teacher_game_page.dart) Last Modified on 1/25/25, 9:25 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/game_page/repository/start_game.dart';

import '../../../../generated/l10n.dart';
import '../../../utils/theme_provider.dart';
import '../../../utils/themes.dart';
import '../repository/get_names.dart';

/// Page for the teacher to view the players in the game and start the game.
/// Same as the [StudentGamePage] but with a start game button and is meant to be projected to the class.
class TeacherGamePage extends ConsumerWidget {
  final String gameCode;
  const TeacherGamePage({Key? key, required this.gameCode}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(lightThemeProvider);
    final themeModeState = ref.watch(themesProvider);
    final playersAsyncValue = ref.watch(playersStreamProvider(gameCode));
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: FloatingActionButton.large(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            child: Text(S.of(context).startGame,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,

              ),
            ),
            onPressed: () async {
              await startGame(gameCode);
              context.go('/teacher_countdown/$gameCode');
            }
        ),
      ),
      appBar: AppBar(
        title: Text(gameCode),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            icon:  themeModeState == ThemeMode.light ? const Icon(Icons.light_mode_outlined) : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(themesProvider.notifier).changeTheme(themeModeState == ThemeMode.light);
            },
          ),
        ),
      ),
      body: playersAsyncValue.when(
        data: (players) {
          return ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(players[index]),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}