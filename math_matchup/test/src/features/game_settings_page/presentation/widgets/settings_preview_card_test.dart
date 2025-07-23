/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (settings_preview_card_test.dart) Last Modified on 7/22/25, 9:44 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_matchup/generated/l10n.dart';
import 'package:math_matchup/src/features/game_settings_page/presentation/widgets/settings_preview_card.dart';

void main() {
  group('SettingsPreviewCard', () {
    testWidgets("SettingsPreviewCard renders properly", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SettingsPreviewCard(
                    questionType: 'Addition',
                    difficulty: 'Easy',
                    timeLimit: '60',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      expect(find.textContaining('Addition'), findsOneWidget);
      expect(find.textContaining('Easy'), findsOneWidget);
      expect(find.textContaining('60'), findsOneWidget);
    });
  });
}
