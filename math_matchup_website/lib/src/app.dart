
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup_website/src/utils/router.dart';
import 'package:math_matchup_website/src/utils/theme_provider.dart';
import 'package:math_matchup_website/src/utils/themes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../generated/l10n.dart';




final localeProvider = StateProvider<Locale>((ref) => const Locale('en', 'US')); // Default locale is English

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final lightTheme = ref.watch(lightThemeProvider);
    final darkTheme = ref.watch(darkThemeProvider);
    final themeModeState = ref.watch(themesProvider);
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
      title: 'MathMatchup',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: goRouter,
      themeMode: themeModeState,
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('es', 'ES'), // Spanish
      ],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: locale,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}