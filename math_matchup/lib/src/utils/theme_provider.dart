/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (theme_provider.dart) Last Modified on 6/24/24, 12:59 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode>((_) {
  return ThemesProvider(ThemeMode.light);
});

class ThemesProvider extends StateNotifier<ThemeMode> {
  ThemesProvider(ThemeMode initialThemeMode) : super(initialThemeMode);
  void changeTheme(bool isOn) {
    state = isOn ? ThemeMode.dark : ThemeMode.light;
  }
}