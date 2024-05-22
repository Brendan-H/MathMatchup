/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (scoring_page.dart) Last Modified on 5/21/24, 6:50 PM
 *
 */
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScoringPage extends StatefulWidget {
  const ScoringPage({Key? key, required this.gameCode}) : super(key: key);
  final String gameCode;

  @override
  _ScoringPageState createState() => _ScoringPageState();
}

class _ScoringPageState extends State<ScoringPage> {
  bool _showLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: _showLoading
                ? const CircularProgressIndicator()
                : const Text("The scores have been calculated!"),
          ),
          const SizedBox(height: 20),
          Container(
            child: _showLoading
                ? null
                : ElevatedButton(
                    onPressed: () {
                      context.go('/game/leaderboard/${widget.gameCode}');
                    },
                    child: const Text("View Leaderboard"),
                  )
          )
        ],
      ),
    );
  }
}
