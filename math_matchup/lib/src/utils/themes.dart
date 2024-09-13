/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (themes.dart) Last Modified on 9/13/24, 10:45 AM
 *
 */

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'themes.g.dart';

///All of the Color themes and properties for the app are stored here to make sure the same feel is on every page.
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
      elevatedButtonSchemeColor: SchemeColor.primaryContainer,
      elevatedButtonElevation: 2,
      elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
  ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    appBarElevation: 2,
    typography: Typography.material2021(platform: defaultTargetPlatform),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        displayLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      )
   // textTheme: Typography.material2021(platform: defaultTargetPlatform).black,
  );
}
///Dark mode color themes and properties for the app.
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
      elevatedButtonSchemeColor: SchemeColor.primaryContainer,
      elevatedButtonElevation: 2,
      elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      appBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    appBarElevation: 5,
    typography: Typography.material2021(platform: defaultTargetPlatform),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      color: Colors.grey[350],
    ),
    displayLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.grey[350],
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.grey[350],
    ),
    headlineMedium: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w600,
      color: Colors.grey[350],
    ),
  )
  //  textTheme: Typography.material2021(platform: defaultTargetPlatform).white,
  );
}