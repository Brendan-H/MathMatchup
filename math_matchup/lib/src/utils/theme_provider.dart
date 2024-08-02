/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (theme_provider.dart) Last Modified on 6/25/24, 8:29 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Allows for theme mode to be changed with the click of a button
final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode>((_) {
  return ThemesProvider(ThemeMode.light);
});

class ThemesProvider extends StateNotifier<ThemeMode> {
  ThemesProvider(ThemeMode initialThemeMode) : super(initialThemeMode);
  void changeTheme(bool isOn) {
    state = isOn ? ThemeMode.dark : ThemeMode.light;
  }
}