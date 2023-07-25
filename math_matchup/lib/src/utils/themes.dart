import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'themes.g.dart';

@riverpod
ThemeData lightTheme(LightThemeRef lightThemeRef) {
  return FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff1976d2),
      primaryContainer: Color(0xff90caf9),
      secondary: Color(0xff039be5),
      secondaryContainer: Color(0xffcbe6ff),
      tertiary: Color(0xff0277bd),
      tertiaryContainer: Color(0xffbedcff),
      appBarColor: Color(0xffcbe6ff),
      error: Color(0xffb00020),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  );
}

@riverpod
ThemeData darkTheme(DarkThemeRef darkThemeRef) {
  return FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xff90caf9),
      primaryContainer: Color(0xff0d47a1),
      secondary: Color(0xff81d4fa),
      secondaryContainer: Color(0xff004b73),
      tertiary: Color(0xffe1f5fe),
      tertiaryContainer: Color(0xff1a567d),
      appBarColor: Color(0xff004b73),
      error: Color(0xffcf6679),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  );
}