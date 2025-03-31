/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (analytics_page.dart) Last Modified on 3/30/25, 7:54 PM
 *
 */


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_matchup/src/app.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart' as charts;

import '../repository/class_analytics.dart';

class AnalyticsPage extends ConsumerStatefulWidget {
  const AnalyticsPage({super.key, required this.gameCode});
  final String gameCode;


  @override
  ConsumerState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends ConsumerState<AnalyticsPage> {
  late Future<GameAnalyticsDTO> _futureAnalytics;

  @override
  void initState() {
    print("GAMECODE: ${widget.gameCode}");
    super.initState();
    _futureAnalytics = getClassAnalytics(widget.gameCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Analytics for ${widget.gameCode}'),
        centerTitle: true,
      ),
      body: FutureBuilder<GameAnalyticsDTO>(
        future: _futureAnalytics,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          } else {
            final classAnalytics = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Table(
                      border: TableBorder.symmetric(
                        inside: BorderSide(color: Colors.black),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                          children: [
                            Center(child: Text('Total Questions')),
                            Center(child: Text('Correct')),
                            Center(child: Text('Incorrect')),
                            Center(child: Text('Points')),
                          ],
                        ),
                        TableRow(
                          children: [
                            Center(child: Text('${classAnalytics.totalQuestions}')),
                            Center(child: Text('${classAnalytics.totalCorrect}')),
                            Center(child: Text('${classAnalytics.totalIncorrect}')),
                            Center(child: Text('${classAnalytics.totalPoints}')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: HorizontalBarChart(_createChartData(classAnalytics))),
              ],
            );
          }
        },
      ),
    );
  }

  List<charts.Series<OrdinalSales, String>> _createChartData(GameAnalyticsDTO classAnalytics) {
    final correctData = classAnalytics.playerAnalyticsList.map((player) => OrdinalSales(player.playerName, player.totalCorrect, Colors.green)).toList();
    final incorrectData = classAnalytics.playerAnalyticsList.map((player) => OrdinalSales(player.playerName, player.totalIncorrect, Colors.red)).toList();

    return [
      //first part of bars (will be shown to the left of incorrect)
      charts.Series<OrdinalSales, String>(
        id: 'Correct',
        domainFn: (OrdinalSales sales, _) => sales.name,
        measureFn: (OrdinalSales sales, _) => sales.value,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: correctData,
        displayName: 'Correct',
      ),
      // 2nd part of bars (will be shown to the right of correct)
      charts.Series<OrdinalSales, String>(
        id: 'Incorrect',
        domainFn: (OrdinalSales sales, _) => sales.name,
        measureFn: (OrdinalSales sales, _) => sales.value,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: incorrectData,
        displayName: 'Incorrect',
      ),
    ];
  }
}

class OrdinalSales {
  final String name;
  final int value;
  final charts.Color color;

  OrdinalSales(this.name, this.value, Color color)
      : this.color = charts.ColorUtil.fromDartColor(color);
}


class HorizontalBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  HorizontalBarChart(this.seriesList, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      animationDuration: const Duration(milliseconds: 500),
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
    );
  }
}
