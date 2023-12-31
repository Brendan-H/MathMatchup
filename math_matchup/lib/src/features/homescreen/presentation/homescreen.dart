/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (homescreen.dart) Last Modified on 7/27/23, 7:58 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/common_widgets/drawer.dart';
import 'package:math_matchup/src/features/homescreen/repository/create_game.dart';
import 'package:math_matchup/src/utils/alert_dialogs.dart';
import 'package:math_matchup/src/utils/themes.dart';

import '../../../../generated/l10n.dart';
import '../repository/join_game.dart';


class GameCodeNotifier extends StateNotifier<String> {
  GameCodeNotifier() : super('');

  void setGameCode(String code) {
    state = code;
  }
}

final gameCodeProvider = StateNotifierProvider<GameCodeNotifier, String>((ref) {
  return GameCodeNotifier();
});
//TODO add widget tests


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final TextEditingController gameCodeController;
  late final TextEditingController nameController;
  final gameCodeProvider = StateProvider<String>((ref) => '');
  String? _gameCodeError;
  String? _nameError;
  String? _validateGameCode(String value) {
    if (value.isEmpty) {
      return 'Game code is required';
    } else if (value.length != 6 || int.tryParse(value) == null) {
      return 'Game code must be 6 digits';
    }
    return null;
  }

  String? _validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  void _onJoinGamePressed(String gamecode, String name, BuildContext context) async {
    String? gameCodeError = _validateGameCode(gameCodeController.text);
    String? nameError = _validateName(nameController.text);

    if (gameCodeError != null || nameError != null) {
      // Input validation failed, show error messages
      setState(() {
        _gameCodeError = gameCodeError;
        _nameError = nameError;
      });
      if (_gameCodeError!.isNotEmpty) {
        showExceptionAlertDialog(context: context, title: "An error occurred", exception: _gameCodeError);
      } else if (_nameError!.isNotEmpty) {
        showExceptionAlertDialog(context: context, title: "An error occurred", exception: _nameError);
      }

    } else {
       joinGame(gameCodeController.text, nameController.text, context);
    }
  }


  @override
  void initState() {
    super.initState();
    gameCodeController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    gameCodeController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.read(lightThemeProvider);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: FloatingActionButton.large(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          backgroundColor: theme.primaryColor,
          child: Text(S.of(context).createGame,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,

            ),
          ),
            onPressed: () async {
            createGame(context);
            }
        ),
      ),
      drawer: CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: Text(S.of(context).welcomeToMathmatchup),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                S.of(context).joinGame,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            TextField(
              controller: gameCodeController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _gameCodeError = _validateGameCode(value);
                });
              },
              decoration: InputDecoration(
                labelText: S.of(context).enterGamecode,
                errorText: _gameCodeError,
                border: const OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    _nameError = _validateName(value);
                  });
                },
                decoration: InputDecoration(
                  labelText: S.of(context).enterName,
                  errorText: _nameError,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(theme.primaryColor)),
                onPressed: () async {
                  String? gameCodeError = _validateGameCode(gameCodeController.text);
                  String? nameError = _validateName(nameController.text);

                  ref.read(gameCodeProvider.notifier).state = gameCodeController.text;
                  print("Code:${ref.read(gameCodeProvider.notifier).state}");
                  _onJoinGamePressed(gameCodeController.text, nameController.text, context);
                },
                child: Text(S.of(context).joinGame, style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}