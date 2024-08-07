import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup_website/src/common_widgets/navbar.dart';

class Header extends ConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                    child: Image.asset('mathmatchuplogo.png', height: 250.0, width: 250.0,)
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    SelectableText('Welcome To', style: Theme.of(context).textTheme.headlineMedium),
                    SelectableText('MathMatchup', style: Theme.of(context).textTheme.headlineLarge),
                    SelectableText('The ultimate learning app', style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
             ],
            ),
            const SizedBox(height: 10),
            Navbar().desktopNavBar(ref),
          ],
        ),
      )
    );
  }
}
