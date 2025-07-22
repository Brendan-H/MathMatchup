/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (game_code_textfield_test.dart) Last Modified on 7/21/25, 9:08 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_matchup/src/features/homescreen/presentation/widgets/game_code_textfield.dart';

void main() {
  group('GameCodeTextField', () {
    testWidgets('renders with label and handles input', (WidgetTester tester) async {
      final controller = TextEditingController();
      String? updatedText;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GameCodeTextField(
              controller: controller,
              label: 'Enter game code',
              onChanged: (value) => updatedText = value,
              errorText: null,
            ),
          ),
        ),
      );

      expect(find.text('Enter game code'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '123456');
      expect(controller.text, '123456');
      expect(updatedText, '123456');
    });

    /// Tests that the error code is shown when errorText is provided.
    /// errorText is null by default and only shown when an error occurs.
    testWidgets('shows error text if provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GameCodeTextField(
              controller: TextEditingController(),
              label: 'Enter game code',
              errorText: 'Invalid code',
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Invalid code'), findsOneWidget);
    });
  });
}

