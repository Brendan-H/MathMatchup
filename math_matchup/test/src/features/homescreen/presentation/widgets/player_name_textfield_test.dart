/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (player_name_textfield_test.dart) Last Modified on 7/21/25, 9:15 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_matchup/src/features/homescreen/presentation/widgets/player_name_textfield.dart';

void main() {
  group('PlayerNameTextField', () {
    testWidgets('renders with label and handles input', (WidgetTester tester) async {
      final controller = TextEditingController();
      String? updatedText;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlayerNameTextField(
              controller: controller,
              label: 'Enter player name',
              onChanged: (value) => updatedText = value,
              errorText: null,
            ),
          ),
        ),
      );

      expect(find.text('Enter player name'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Player1');
      expect(controller.text, 'Player1');
      expect(updatedText, 'Player1');
    });

    /// Tests that the error code is shown when errorText is provided.
    /// errorText is null by default and only shown when an error occurs.
    testWidgets('shows error text if provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlayerNameTextField(
              controller: TextEditingController(),
              label: 'Enter player name',
              errorText: 'Invalid name',
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Invalid name'), findsOneWidget);
    });
  });
}