/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (homescreen_appbar_test.dart) Last Modified on 7/21/25, 9:21 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_matchup/generated/l10n.dart';
import 'package:math_matchup/src/features/homescreen/presentation/widgets/homescreen_appbar.dart';

void main() {
  group('HomescreenAppBar', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Consumer(
                  builder: (context, ref, _) => HomescreenAppBar(ref: ref, actions: []),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(HomescreenAppBar), findsOneWidget);
      expect(find.text('MathMatchup'), findsOneWidget);
    });
  });
}