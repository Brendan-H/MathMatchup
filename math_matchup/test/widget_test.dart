/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (widget_test.dart) Last Modified on 8/24/23, 2:18 PM
 *
 */

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_matchup/src/app.dart';
import 'package:math_matchup/src/features/homescreen/repository/create_game.dart';
import 'package:math_matchup/src/features/homescreen/repository/join_game.dart';


void main() {
  testWidgets('createGame Test', (WidgetTester tester) async {
    // Mock Dio responses
    final dio = Dio();
    dio.options = BaseOptions(validateStatus: (_) => true);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.resolve(Response(data: {'gameCode': '123456'}, requestOptions: RequestOptions()));
        },
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => createGame(context),
            child: const Text('Create Game'),
          ),
        ),
      ),
    );

    // Tap the button and wait for the asynchronous operations to complete
    await tester.tap(find.text('Create Game'));
    await tester.pumpAndSettle();

    // Verify the expected behavior, e.g., navigation, dialogs, etc.
  });

  testWidgets('joinGame Test', (WidgetTester tester) async {
    // Mock Dio responses
    final dio = Dio();
    dio.options = BaseOptions(validateStatus: (_) => true);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.resolve(Response(data: {}, requestOptions: RequestOptions())); // Simulate a successful response
        },
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => joinGame('123456', 'John', context),
            child: const Text('Join Game'),
          ),
        ),
      ),
    );

    // Tap the button and wait for the asynchronous operations to complete
    await tester.tap(find.text('Join Game'));
    await tester.pumpAndSettle();

    // Verify the expected behavior, e.g., navigation, dialogs, etc.
  });
}