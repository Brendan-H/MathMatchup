import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup/main.dart';
import 'package:riverpod/riverpod.dart';


class Router {
  static GoRouter returnRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MyHomePage());
          }
        ),
      ],
    );
  }
}