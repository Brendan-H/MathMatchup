
import 'package:flutter/material.dart';
import 'package:math_matchup_website/utils/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Navbar {
  Widget desktopNavBar(WidgetRef ref) {
    final theme = ref.read(lightThemeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () async {}, child: Text("Pricing", style: theme.textTheme.titleMedium,))
      ],
    );
  }
}