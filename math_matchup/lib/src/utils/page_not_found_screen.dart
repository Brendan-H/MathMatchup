/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (page_not_found_screen.dart) Last Modified on 1/25/25, 9:25 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('404 - Page Not Found', style: Theme.of(context).textTheme.headlineLarge),
          ElevatedButton(onPressed: () => context.go('/'), child: const Text('Go Home'))
        ],
      ),
    );
  }
}

