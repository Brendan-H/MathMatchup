/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (homescreen.dart) Last Modified on 3/30/25, 9:43 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/common_widgets/custom_dropdown.dart';
import 'package:math_matchup/src/common_widgets/main_drawer.dart';
import 'package:math_matchup/src/utils/alert_dialogs.dart';
import 'package:math_matchup/src/utils/auth_provider.dart';
import 'package:math_matchup/src/utils/themes.dart';

import '../../../../generated/l10n.dart';
import '../../../app.dart';
import '../../../utils/theme_provider.dart';
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
  final gameCodeProvider = StateProvider<String>((ref) => '');
  String? _gameCodeError;
  String? _nameError;
  String? _validateGameCode(String value) {
    if (value.isEmpty) {
      return S.of(context).gameCodeIsRequired;
    } else if (value.length != 6 || int.tryParse(value) == null) {
      return S.of(context).gameCodeMustBe6Digits;
    }
    return null;
  }

  String? _validateName(String value) {
    if (value.isEmpty) {
      return S.of(context).nameIsRequired;
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
        showExceptionAlertDialog(context: context, title: S.of(context).anErrorOccurred, exception: _gameCodeError);
      } else if (_nameError!.isNotEmpty) {
        showExceptionAlertDialog(context: context, title: S.of(context).anErrorOccurred, exception: _nameError);
      }

    } else {
       joinGame(gameCodeController.text, nameController.text, context, ref);
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
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final user = ref.watch(authStateProvider);
    final Map<Locale, String> locales = {
      const Locale('en', 'US'): 'English',
      const Locale('es', 'ES'): 'Español',
    };
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
         child: Builder(
           builder: (BuildContext innerContext) {
             return IconButton(icon: Icon(Icons.menu, color: theme.colorScheme.onPrimaryContainer, size: 30,), onPressed: () {Scaffold.of(innerContext).openDrawer();});
           }
         ),
          // child: IconButton(
          //   icon:  themeModeState == ThemeMode.light ? const Icon(Icons.light_mode_outlined) : const Icon(Icons.dark_mode_outlined),
          //   onPressed: () {
          //     ref.read(themesProvider.notifier).changeTheme(themeModeState == ThemeMode.light);
          //   },
          // ),
        ),
        actions: [
         CustomDropdown(items: locales, selectedItem: ref.watch(localeProvider.notifier).state)
        ],
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.05),
        toolbarHeight: MediaQuery.of(context).size.height * .085,
        title: Text(S.of(context).welcomeToMathmatchup, style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onPrimaryContainer,
        ),),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
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
                      color: theme.textTheme.headlineLarge?.color,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                 controller: gameCodeController,
                  // maxLength: 6,
                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                 keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _gameCodeError = _validateGameCode(value);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: S.of(context).enterGamecode,
                    floatingLabelStyle: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    errorText: _gameCodeError,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: theme.colorScheme.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                      floatingLabelStyle: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.colorScheme.primary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .1,
                  child: ElevatedButton(
                    onPressed: () async {
                      String? gameCodeError = _validateGameCode(gameCodeController.text);
                      String? nameError = _validateName(nameController.text);

                      ref.read(gameCodeProvider.notifier).state = gameCodeController.text;
                      print("Code:${ref.read(gameCodeProvider.notifier).state}");
                      _onJoinGamePressed(gameCodeController.text, nameController.text, context);
                    },
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