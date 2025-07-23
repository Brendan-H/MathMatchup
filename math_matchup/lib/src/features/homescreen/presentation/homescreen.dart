/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (homescreen.dart) Last Modified on 7/20/25, 1:37 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/common_widgets/custom_dropdown.dart';
import 'package:math_matchup/src/common_widgets/main_drawer.dart';
import 'package:math_matchup/src/features/homescreen/domain/join_button_controller.dart';
import 'package:math_matchup/src/features/homescreen/presentation/widgets/game_code_textfield.dart';
import 'package:math_matchup/src/features/homescreen/presentation/widgets/homescreen_appbar.dart';
import 'package:math_matchup/src/features/homescreen/presentation/widgets/player_name_textfield.dart';
import 'package:math_matchup/src/utils/auth_provider.dart';
import '../domain/input_validation.dart';
import '../../../../generated/l10n.dart';
import '../../../app.dart';


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


/// Landing page of the app where the user can either join or create a game.
///
/// There is also both a dark mode theme switcher and a language switcher.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final TextEditingController gameCodeController;
  late final TextEditingController nameController;
  String? _gameCodeError;
  String? _nameError;



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
    final Map<Locale, String> locales = {
      const Locale('en', 'US'): 'English',
      const Locale('es', 'ES'): 'Español',
    };
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final user = ref.watch(authStateProvider);
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: HomescreenAppBar(ref: ref, actions: [CustomDropdown(items: locales, selectedItem: ref.watch(localeProvider.notifier).state)]),
      body: SafeArea(
        minimum: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 8),
                  child: Text(
                    S.of(context).joinGame,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: textTheme.headlineLarge?.color,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                GameCodeTextField(
                   controller: gameCodeController,
                   label: S.of(context).enterGamecode,
                   onChanged: (value) {
                     setState(() {
                      _gameCodeError = validateGameCode(context, value);
                    });
                 },
                   errorText: _gameCodeError,
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: PlayerNameTextField(
                    controller: nameController,
                    label: S.of(context).enterName,
                    onChanged: (value) {
                      setState(() {
                        _nameError = validateName(context, value);
                      });
                    },
                    errorText: _nameError,
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .1,
                  child: ElevatedButton(
                    onPressed: () => handleJoinGame(
                          ref: ref,
                          context: context,
                          gameCodeController: gameCodeController,
                          nameController: nameController,
                          onValidationError: (codeError, nameError) {
                            setState(() {
                              _gameCodeError = codeError;
                              _nameError = nameError;
                            });
                          },
                      ),
                    child: Text(S.of(context).joinGame, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textTheme.headlineLarge?.color,),),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(S.of(context).or, style: textTheme.displayMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                    const Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .1,
                    child: ElevatedButton(
                        child: Text(S.of(context).createGame,
                          style: TextStyle(
                            color: textTheme.headlineLarge?.color,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          if (user == null) {
                          context.go('/game/creation_homepage');
                          } else {
                            context.go('/game/settings');
                          }
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}