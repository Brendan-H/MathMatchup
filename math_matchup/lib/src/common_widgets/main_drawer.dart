/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (main_drawer.dart) Last Modified on 1/26/25, 3:53 PM
 *
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/theme_provider.dart';
import '../utils/themes.dart';

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key});

  @override
  ConsumerState createState() => _MainDrawerState();
}

class _MainDrawerState extends ConsumerState<MainDrawer> {
  String themeModeToString(ThemeMode themeMode) {
    return themeMode == ThemeMode.light ? 'Light' : 'Dark';
  }
  @override
  Widget build(BuildContext context) {
    final themeModeState = ref.watch(themesProvider);
    final theme = themeModeState == ThemeMode.light ? ref.read(lightThemeProvider) : ref.read(darkThemeProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * .175,
            child: DrawerHeader(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      FirebaseAuth.instance.currentUser?.email ?? "Email not found",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Welcome, ${FirebaseAuth.instance.currentUser?.displayName ?? "User"}"),
          ),
          ListTile(
            leading: themeModeState == ThemeMode.light ? const Icon(Icons.light_mode_outlined) : const Icon(Icons.dark_mode_outlined),
            title: Text('Theme Mode: ${themeModeToString(themeModeState)}'),
            onTap: () {
              ref.read(themesProvider.notifier).changeTheme(themeModeState == ThemeMode.light);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
