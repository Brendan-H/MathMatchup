/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (results_page.dart) Last Modified on 5/21/24, 4:41 PM
 *
 */

import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final int points;
  const ResultsPage({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('You scored $points points! Nice job! Look to your teacher\'s screen for the results'),
      ),);
  }
}

