/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (results_page.dart) Last Modified on 5/22/24, 7:09 PM
 *
 */

import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class ResultsPage extends StatelessWidget {
  final int points;
  const ResultsPage({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).youScoredXPoints(points)),
      ),);
  }
}

