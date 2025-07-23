/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (settings_preview_card.dart) Last Modified on 7/22/25, 9:30 PM
 *
 */

import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class SettingsPreviewCard extends StatelessWidget {
  final String questionType;
  final String difficulty;
  final String timeLimit;

  const SettingsPreviewCard({
    super.key,
    required this.questionType,
    required this.difficulty,
    required this.timeLimit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).aboutCreateGameWithSettings,
              style: textTheme.displayLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.question_answer_outlined, size: 22),
                const SizedBox(width: 8),
                Text("${S.of(context).questionType}: ", style: textTheme.displayMedium),
                Flexible(
                  child: Text(
                      questionType,
                      style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.flag_outlined, size: 22),
                const SizedBox(width: 8),
                Text("${S.of(context).difficulty}: ", style: textTheme.displayMedium),
                Flexible(
                  child: Text(
                    difficulty,
                    style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.timer_outlined, size: 22),
                const SizedBox(width: 8),
                Text("${S.of(context).timeLimit}: ", style: textTheme.displayMedium),
                Flexible(
                  child: Text(
                    "$timeLimit Seconds",
                    style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}