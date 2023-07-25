import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/main.dart';
import 'package:math_matchup/src/features/homescreen/presentation/homescreen.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'Router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef goRouterRef) {
  return GoRouter(
      routes: [
        GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return const MaterialPage(child: HomeScreen());
            }
        ),
      ],
  );
}