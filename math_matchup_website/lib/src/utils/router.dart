/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (router.dart) Last Modified on 7/31/24, 6:10 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup_website/src/app.dart';
import 'package:math_matchup_website/src/education_purchase/presentation/admin_account_page.dart';
import 'package:math_matchup_website/src/features/pricing/presentation/education_pricing_page.dart';
import 'package:math_matchup_website/src/utils/page_not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../education_purchase/presentation/education_purchase_page.dart';
import '../features/homescreen/presentation/homescreen.dart';

part 'router.g.dart';


@riverpod
GoRouter goRouter(GoRouterRef goRouterRef) {
  return GoRouter(
    navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return const MaterialPage(child: Homescreen());
            }
        ),
        GoRoute(
            path: '/education/pricing',
            pageBuilder: (context, state) {
              return const MaterialPage(child: EducationPricingPage());
            }
        ),
        GoRoute(
            path: '/education/login',
            pageBuilder: (context, state) {
              return const MaterialPage(child: AdminAccountPage());
            }
        ),
        GoRoute(
            path: '/education/purchase',
            pageBuilder: (context, state) {
              return const MaterialPage(child: EducationPurchasePage());
            }
        ),

      ],
    errorBuilder: (context, state) => const PageNotFoundScreen(),
    initialLocation: '/',
  );
}