/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (labeled_dropdown_test.dart) Last Modified on 7/22/25, 9:36 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_matchup/src/features/game_settings_page/presentation/widgets/labeled_dropdown.dart';

void main() {
  group("Labeled Dropdown", () {
    testWidgets('renders and can correctly select values', (WidgetTester tester) async {
      String? selectedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Center(
                  child: LabeledDropdown<String>(
                    label: 'Select an option',
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                          value: 'Option 1', child: Text('Option 1')),
                      DropdownMenuItem(
                          value: 'Option 2', child: Text('Option 2')),
                      DropdownMenuItem(
                          value: 'Option 3', child: Text('Option 3')),
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      );
      expect(find.text('Select an option'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.text('Option 1'), findsNothing);
      await tester.tap(find.byType(DropdownButton<String>));
      //pumpandsettle waits for animations to finish (in this case, the dropdown opening)
      await tester.pumpAndSettle();
      await tester.tap(find.text('Option 1').last);
      await tester.pumpAndSettle();
      expect(selectedValue, 'Option 1');
      expect(find.text('Option 1'), findsOneWidget);
    });
  });
}
