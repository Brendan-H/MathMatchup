/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (themes.dart) Last Modified on 1/26/25, 3:56 PM
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
  //    elevatedButtonSchemeColor: SchemeColor.primaryContainer,
      elevatedButtonElevation: 2,
     elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      appBarBackgroundSchemeColor: SchemeColor.primaryContainer,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 8,
      inputDecoratorUnfocusedHasBorder: true,
      inputDecoratorSchemeColor: SchemeColor.secondaryContainer,
      //TOOO fix the little text when you click on the textfield because it now turns somewhat invisible
      cardRadius: 12,
      cardElevation: 4,
      chipRadius: 8,
      elevatedButtonSchemeColor: SchemeColor.primary,
      outlinedButtonSchemeColor: SchemeColor.primary,
      textButtonSchemeColor: SchemeColor.primary,
      switchSchemeColor: SchemeColor.primary,
      checkboxSchemeColor: SchemeColor.primary,
      radioSchemeColor: SchemeColor.primary,
      sliderBaseSchemeColor: SchemeColor.primary,
      chipSchemeColor: SchemeColor.primaryContainer,
      sliderTrackHeight: 4,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      bottomSheetRadius: 24,
      dialogRadius: 16,
      tooltipRadius: 8,
      tooltipSchemeColor: SchemeColor.tertiary,
      snackBarBackgroundSchemeColor: SchemeColor.inversePrimary,
      buttonMinSize: Size(48, 48),
      tooltipOpacity: 0.9,
      inputDecoratorIsFilled: true,
      snackBarRadius: 12,
      appBarScrolledUnderElevation: 6,
      appBarForegroundSchemeColor: SchemeColor.onSecondaryContainer,
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
  ).copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xffcbe6ff),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
    ),
  );
}
///Dark mode color themes and properties for the app.
@riverpod
ThemeData darkTheme(DarkThemeRef darkThemeRef) {
  return FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xff90caf9),             // light version of 0xff1976d2
      primaryContainer: Color(0xff0d47a1),     // dark version of 0xff90caf9
      secondary: Color(0xff81d4fa),            // light version of 0xff039be5
      secondaryContainer: Color(0xff004b73),   // dark version of 0xffcbe6ff
      tertiary: Color(0xffe1f5fe),             // light version of 0xff0277bd
      tertiaryContainer: Color(0xff1a567d),    // dark version of 0xffbedcff
      appBarColor: Color(0xff004b73),
      error: Color(0xffcf6679),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      useTextTheme: true,
      elevatedButtonElevation: 2,
      elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      appBarBackgroundSchemeColor: SchemeColor.primaryContainer,
      appBarForegroundSchemeColor: SchemeColor.onSecondaryContainer,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 8,
      inputDecoratorUnfocusedHasBorder: true,
      inputDecoratorSchemeColor: SchemeColor.secondaryContainer,
      inputDecoratorIsFilled: true,
      cardRadius: 12,
      cardElevation: 4,
      chipRadius: 8,
      elevatedButtonSchemeColor: SchemeColor.primary,
      outlinedButtonSchemeColor: SchemeColor.primary,
      textButtonSchemeColor: SchemeColor.primary,
      switchSchemeColor: SchemeColor.primary,
      checkboxSchemeColor: SchemeColor.primary,
      radioSchemeColor: SchemeColor.primary,
      sliderBaseSchemeColor: SchemeColor.primary,
      chipSchemeColor: SchemeColor.primaryContainer,
      sliderTrackHeight: 4,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      bottomSheetRadius: 24,
      dialogRadius: 16,
      tooltipRadius: 8,
      tooltipSchemeColor: SchemeColor.tertiary,
      snackBarBackgroundSchemeColor: SchemeColor.inversePrimary,
      snackBarRadius: 12,
      tooltipOpacity: 0.9,
      appBarScrolledUnderElevation: 6,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    appBarElevation: 5,
    typography: Typography.material2021(platform: defaultTargetPlatform),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
  ).copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff004b73),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
    ),
  );
}
