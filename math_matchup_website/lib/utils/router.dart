/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (router.dart) Last Modified on 7/31/24, 6:10 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup_website/utils/page_not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../src/features/homescreen/presentation/homescreen.dart';

part 'router.g.dart';


@riverpod
GoRouter goRouter(GoRouterRef goRouterRef) {
  return GoRouter(
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return const MaterialPage(child: Homescreen());
            }
        ),

      ],
    errorBuilder: (context, state) => const PageNotFoundScreen(),
  );
}