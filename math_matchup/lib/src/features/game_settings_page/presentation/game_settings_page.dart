/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (game_settings_page.dart) Last Modified on 6/24/24, 9:36 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/features/game_settings_page/repository/create_game.dart';
import 'package:math_matchup/src/utils/themes.dart';
import '../../../../generated/l10n.dart';
import '../../../utils/theme_provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            icon:  themeModeState == ThemeMode.light ? const Icon(Icons.light_mode_outlined) : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(themesProvider.notifier).changeTheme(themeModeState == ThemeMode.light);
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
                  Text("Question Type", style: textTheme.displayLarge,),
                  const Spacer(),
                  DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          value: "Addition",
                          child: Text("Addition"),
                        ),
                        DropdownMenuItem(
                          value: "Subtraction",
                          child: Text("Subtraction"),
                        ),
                        DropdownMenuItem(
                          value: "Multiplication",
                          child: Text("Multiplication"),
                        ),
                        DropdownMenuItem(
                          value: "Division",
                          child: Text("Division"),
                        ),
                      ],
                    onChanged: (value) {
                      ref.read(selectedQuestionTypeProvider.notifier).state = value as String;
                      setState(() {});
                      // TODO find workaround for this that doesn't require setState
                    },
                    hint: const Text("Select Question Type"),
                    value: ref.watch(selectedQuestionTypeProvider.notifier).state,
                  ),
                ],
              ),
              const Divider(thickness: 2,),
              Row(
                children: [
                  Text("Difficulty", style: textTheme.displayLarge,),
                  const Spacer(),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: "Easy",
                        child: Text("Easy"),
                      ),
                      DropdownMenuItem(
                        value: "Medium",
                        child: Text("Medium"),
                      ),
                      DropdownMenuItem(
                        value: "Hard",
                        child: Text("Hard"),
                      ),
                      DropdownMenuItem(
                        value: "Impossible",
                        child: Text("Impossible"),
                      ),
                    ],
                    onChanged: (value) {
                      ref.read(selectedDifficultyProvider.notifier).state = value as String;
                      setState(() {});
                      // TODO find workaround for this that doesn't require setState
                    },
                    hint: const Text("Select Difficulty"),
                    value: ref.watch(selectedDifficultyProvider.notifier).state,
                  ),
                ],
              ),
              const Divider(thickness: 2,),
              Row(
                children: [
                  Text("Time Limit", style: textTheme.displayLarge),
                  const Spacer(),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: "30",
                        child: Text("30 Seconds"),
                      ),
                      DropdownMenuItem(
                        value: "60",
                        child: Text("1 Minute"),
                      ),
                      DropdownMenuItem(
                        value: "120",
                        child: Text("2 Minutes"),
                      ),
                      DropdownMenuItem(
                        value: "300",
                        child: Text("5 Minutes"),
                      ),
                      DropdownMenuItem(
                        value: "600",
                        child: Text("10 Minutes"),
                      ),
                    ],
                    onChanged: (value) {
                      ref.read(timeLimitProvider.notifier).state = value as String;
                      setState(() {});
                      // TODO find workaround for this that doesn't require setState
                    },
                    hint: const Text("Select Time Limit"),
                    value: ref.watch(timeLimitProvider.notifier).state,
                  ),
                ],
              ),
              const Divider(thickness: 2,),
              Text("You are about to create a game with the following settings:", style: textTheme.displayLarge,),
              Text("Question Type: ${ref.watch(selectedQuestionTypeProvider.notifier).state},"
                  " \nDifficulty: ${ref.watch(selectedDifficultyProvider.notifier).state},"
                  " \nTime Limit: ${ref.watch(timeLimitProvider.notifier).state} seconds (${(int.parse(ref.watch(timeLimitProvider.notifier).state ?? "0") ?? 0) / 60} minutes),"
                  " \nAre you sure you want to proceed?", style: textTheme.displayMedium,),
              const SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .1,
                child: ElevatedButton(
                  onPressed: () {
                    createGame(context, ref.watch(selectedDifficultyProvider.notifier).state ?? "Easy", ref.watch(selectedQuestionTypeProvider.notifier).state ?? "Addition", int.parse(ref.watch(timeLimitProvider.notifier).state ?? "30"));
                  },
                  child: Text("Create Game", style: textTheme.headlineMedium,),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
