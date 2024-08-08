
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/keys.dart';
import '../utils/themes.dart';

class Navbar {
  Widget desktopNavBar(WidgetRef ref) {
    final theme = ref.read(lightThemeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () => Scrollable.ensureVisible(
      Keys.aboutKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
            ),
              child: Text("Home", style: theme.textTheme.displayLarge,)),
        TextButton(
            onPressed: () => Scrollable.ensureVisible(
              Keys.aboutKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
            ),
            child: Text("About", style: theme.textTheme.displayLarge,)),
        TextButton(
            onPressed: () => Scrollable.ensureVisible(
              Keys.pricingKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
            ),
            child: Text("Screenshots", style: theme.textTheme.displayLarge,)),
        TextButton(
            onPressed: () => Scrollable.ensureVisible(
              Keys.aboutKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
            ),
            child: Text("Pricing", style: theme.textTheme.displayLarge,)),
        TextButton(
            onPressed: () => Scrollable.ensureVisible(
              Keys.aboutKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
            ),
            child: Text("Contact", style: theme.textTheme.displayLarge,)),
        ElevatedButton(onPressed: () { try {
          final uri = Uri(scheme: 'https', host: 'mathmatchupapp.brendanharan.com', path: '/');
          launchUrl(uri);
        } on Exception catch (e) {
          print(e);
        }}, child: Text("MathMatchup Web", style: theme.textTheme.displayLarge,)),
      ],
    );
  }
}