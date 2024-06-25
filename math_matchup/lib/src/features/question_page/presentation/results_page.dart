/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (results_page.dart) Last Modified on 6/24/24, 12:59 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';

class ResultsPage extends StatelessWidget {
  final int points;
  const ResultsPage({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).youScoredXPoints(points), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .1,
                child: ElevatedButton(
                  onPressed: () async {
                    context.go('/');
                  },
                  child: Text(S.of(context).goBackHome, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textTheme.headlineLarge?.color,),),
                ),
              ),
            ),
          ],
        ),
      ),);
  }
}

