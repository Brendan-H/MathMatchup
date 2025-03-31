/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (analytics_page.dart) Last Modified on 3/30/25, 7:54 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/app.dart';

class AnalyticsPage extends ConsumerStatefulWidget {
  const AnalyticsPage({super.key});

  @override
  ConsumerState createState() => _AnalyticsPageState();
}

//analytics page that looks like the grade disparity website, will have a section saying  who needs help and who is doing well

class _AnalyticsPageState extends ConsumerState<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    final classAnalytics = ref.read(classAnalyticsProvider.notifier).state;
    return Container();
  }
}
