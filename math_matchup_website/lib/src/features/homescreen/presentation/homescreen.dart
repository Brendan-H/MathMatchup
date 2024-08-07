
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup_website/src/features/header/presentation/header.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [
          Header(),
          ElevatedButton(
              onPressed: ()  {
                try {
                  final uri = Uri(scheme: 'https', host: 'mathmatchupapp.brendanharan.com', path: '/');
                  launchUrl(uri);
                } on Exception catch (e) {
                  print(e);
                }
              },
              child: Text("Go to mathmatchup app", style: Theme.of(context).textTheme.bodyLarge,),
          )
        ],
      ),
    );
  }
}
