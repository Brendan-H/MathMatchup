import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/common_widgets/drawer.dart';
import 'package:math_matchup/src/features/homescreen/presentation/homescreen.dart';

import '../repository/get_names.dart';


class GamePage extends ConsumerWidget {
  final String gameCode;

  GamePage({Key? key, required this.gameCode}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersAsyncValue = ref.watch(playersStreamProvider(gameCode));

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(gameCode),
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
            loading: () => Expanded(child: Center(child: CircularProgressIndicator())),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ],
      ),
    );
  }
}
