/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (game_settings_page.dart) Last Modified on 6/25/24, 7:52 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/game_settings_page/repository/create_game.dart';
import 'package:math_matchup/src/utils/themes.dart';
import '../../../../generated/l10n.dart';
import '../../../utils/theme_provider.dart';

/// The page where the user can choose the settings for the game they want to create.
///
/// Settings are shared with students who join the game and their games reflect these settings.
class GameSettingsPage extends ConsumerStatefulWidget {
  const GameSettingsPage({Key? key}) : super(key: key);

  @override
  _GameSettingsPageState createState() => _GameSettingsPageState();
}
final selectedQuestionTypeProvider = StateProvider<String?>((ref) => null);
final selectedDifficultyProvider = StateProvider<String?>((ref) => null);
final timeLimitProvider = StateProvider<String?>((ref) => null);

class _GameSettingsPageState extends ConsumerState<GameSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeModeState = ref.watch(themesProvider);
    final theme = themeModeState == ThemeMode.light ? ref.read(lightThemeProvider) : ref.read(darkThemeProvider);
    final textTheme = theme.textTheme;
    var questionType = ref.watch(selectedQuestionTypeProvider.notifier).state ?? S.of(context).notChosen;
    var difficulty = ref.watch(selectedDifficultyProvider.notifier).state ?? S.of(context).notChosen;
    var timeLimit = ref.watch(timeLimitProvider.notifier).state ?? S.of(context).notChosen;

    return Scaffold(
      appBar: AppBar(
        //back button
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            icon:  const Icon(Icons.arrow_back),
            onPressed: () {
            context.go('/');
              },
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: Text(S.of(context).chooseGameSettings),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(S.of(context).questionType, style: textTheme.displayLarge,),
                  ),
                  Expanded(
                    child: DropdownButton(
                        items: [
                          DropdownMenuItem(
                            value: "Addition",
                            child: Text(S.of(context).addition),
                          ),
                          DropdownMenuItem(
                            value: "Subtraction",
                            child: Text(S.of(context).subtraction),
                          ),
                          DropdownMenuItem(
                            value: "Multiplication",
                            child: Text(S.of(context).multiplication),
                          ),
                          DropdownMenuItem(
                            value: "Division",
                            child: Text(S.of(context).division),
                          ),
                        ],
                      onChanged: (value) {
                        ref.read(selectedQuestionTypeProvider.notifier).state = value as String;
                        setState(() {});
                        // TODO find workaround for this that doesn't require setState
                      },
                      hint:  Text(S.of(context).selectQuestionType),
                      value: ref.watch(selectedQuestionTypeProvider.notifier).state,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(S.of(context).difficulty, style: textTheme.displayLarge,),
                  ),
                  Expanded(
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          value: "Easy",
                          child: Text(S.of(context).easy),
                        ),
                        DropdownMenuItem(
                          value: "Medium",
                          child: Text(S.of(context).medium),
                        ),
                        DropdownMenuItem(
                          value: "Hard",
                          child: Text(S.of(context).hard),
                        ),
                        DropdownMenuItem(
                          value: "Impossible",
                          child: Text(S.of(context).impossible),
                        ),
                      ],
                      onChanged: (value) {
                        ref.read(selectedDifficultyProvider.notifier).state = value as String;
                        setState(() {});
                        // TODO find workaround for this that doesn't require setState
                      },
                      hint: Text(S.of(context).selectDifficulty),
                      value: ref.watch(selectedDifficultyProvider.notifier).state,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(S.of(context).timeLimit, style: textTheme.displayLarge),
                  ),
                  Expanded(
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          value: "30",
                          child: Text(S.of(context).ThirtySeconds),
                        ),
                        DropdownMenuItem(
                          value: "60",
                          child: Text(S.of(context).OneMinute),
                        ),
                        DropdownMenuItem(
                          value: "120",
                          child: Text(S.of(context).TwoMinutes),
                        ),
                        DropdownMenuItem(
                          value: "300",
                          child: Text(S.of(context).FiveMinutes),
                        ),
                        DropdownMenuItem(
                          value: "600",
                          child: Text(S.of(context).TenMinutes),
                        ),
                      ],
                      onChanged: (value) {
                        ref.read(timeLimitProvider.notifier).state = value as String;
                        setState(() {});
                        // TODO find workaround for this that doesn't require setState
                      },
                      hint:  Text(S.of(context).selectTimeLimit),
                      value: ref.watch(timeLimitProvider.notifier).state,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2,),
              Text(S.of(context).aboutCreateGameWithSettings, style: textTheme.displayLarge,),
              Text("${S.of(context).questionType}: $questionType", style: textTheme.displayLarge,),
              Text("${S.of(context).difficulty}: $difficulty", style: textTheme.displayLarge,),
              Text("${S.of(context).timeLimit}: $timeLimit Seconds", style: textTheme.displayLarge,),
              const SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .1,
                child: ElevatedButton(
                  onPressed: () {
                    createGame(context, ref.watch(selectedDifficultyProvider.notifier).state ?? "Easy", ref.watch(selectedQuestionTypeProvider.notifier).state ?? "Addition", int.parse(ref.watch(timeLimitProvider.notifier).state ?? "30"));
                  },
                  child: Text(S.of(context).createGame, style: textTheme.headlineMedium,),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
