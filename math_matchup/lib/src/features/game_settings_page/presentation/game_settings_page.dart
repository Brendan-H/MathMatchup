/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (game_settings_page.dart) Last Modified on 7/20/25, 1:37 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/src/features/game_settings_page/repository/create_game.dart';
import '../../../../generated/l10n.dart';

/// The page where the user can choose the settings for the game they want to create.
///
/// Settings are shared with students who join the game and their games reflect these settings.
class GameSettingsPage extends ConsumerStatefulWidget {
  const GameSettingsPage({super.key});

  @override
  _GameSettingsPageState createState() => _GameSettingsPageState();
}
final selectedQuestionTypeProvider = StateProvider<String?>((ref) => null);
final selectedDifficultyProvider = StateProvider<String?>((ref) => null);
final timeLimitProvider = StateProvider<String?>((ref) => null);


class _GameSettingsPageState extends ConsumerState<GameSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).questionType, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: ref.watch(selectedQuestionTypeProvider),
                            hint: Text(S.of(context).selectQuestionType),
                            items: [
                              DropdownMenuItem(value: "Addition", child: Text(S.of(context).addition)),
                              DropdownMenuItem(value: "Subtraction", child: Text(S.of(context).subtraction)),
                              DropdownMenuItem(value: "Multiplication", child: Text(S.of(context).multiplication)),
                              DropdownMenuItem(value: "Division", child: Text(S.of(context).division)),
                            ],
                            onChanged: (value) {
                              ref.read(selectedQuestionTypeProvider.notifier).state = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(S.of(context).difficulty, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: ref.watch(selectedDifficultyProvider),
                            hint: Text(S.of(context).selectDifficulty),
                            items: [
                              DropdownMenuItem(value: "Easy", child: Text(S.of(context).easy)),
                              DropdownMenuItem(value: "Medium", child: Text(S.of(context).medium)),
                              DropdownMenuItem(value: "Hard", child: Text(S.of(context).hard)),
                              DropdownMenuItem(value: "Impossible", child: Text(S.of(context).impossible)),
                            ],
                            onChanged: (value) {
                              ref.read(selectedDifficultyProvider.notifier).state = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(S.of(context).timeLimit, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: ref.watch(timeLimitProvider),
                            hint: Text(S.of(context).selectTimeLimit),
                            items: [
                              DropdownMenuItem(value: "30", child: Text(S.of(context).ThirtySeconds)),
                              DropdownMenuItem(value: "60", child: Text(S.of(context).OneMinute)),
                              DropdownMenuItem(value: "120", child: Text(S.of(context).TwoMinutes)),
                              DropdownMenuItem(value: "300", child: Text(S.of(context).FiveMinutes)),
                              DropdownMenuItem(value: "600", child: Text(S.of(context).TenMinutes)),
                            ],
                            onChanged: (value) {
                              ref.read(timeLimitProvider.notifier).state = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).aboutCreateGameWithSettings,
                        style: textTheme.displayLarge,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.question_answer_outlined, size: 22),
                          const SizedBox(width: 8),
                          Text("${S.of(context).questionType}: ", style: textTheme.displayMedium),
                          Text(questionType, style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.flag_outlined, size: 22),
                          const SizedBox(width: 8),
                          Text("${S.of(context).difficulty}: ", style: textTheme.displayMedium),
                          Text(difficulty, style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.timer_outlined, size: 22),
                          const SizedBox(width: 8),
                          Text("${S.of(context).timeLimit}: ", style: textTheme.displayMedium),
                          Text("$timeLimit Seconds", style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


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
