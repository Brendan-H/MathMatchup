import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/keys.dart';
class About extends ConsumerWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      key: Keys.aboutKey,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            SelectableText("About", style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            SelectableText("Players join the game and are separated into teams."
                " The only catch is that they don't know their teammate."
                " They then have to answer questions to get points, which get added together with their partner's points at the end. "
                "Teammates are revealed and the partnership with the most points wins!",
                style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
          ]
        ),
      ),
    );
  }
}
