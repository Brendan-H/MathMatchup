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
  const AnalyticsPage({super.key});

  @override
  ConsumerState createState() => _AnalyticsPageState();
}

//analytics page that looks like the grade disparity website, will have a section saying  who needs help and who is doing well

class _AnalyticsPageState extends ConsumerState<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    final classAnalytics = ref.read(classAnalyticsProvider.notifier).state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Analytics'),
        centerTitle: true,
      ),
      body: Column(
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
                      Center(child: Text('${classAnalytics?.totalQuestions}')),
                      Center(child: Text('${classAnalytics?.totalCorrect}')),
                      Center(child: Text('${classAnalytics?.totalIncorrect}')),
                      Center(child: Text('${classAnalytics?.totalPoints}')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: HorizontalBarChart(HorizontalBarChart._createSampleData())),

        ],
      ),
    );
  }
}
class HorizontalBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  HorizontalBarChart(this.seriesList, {this.animate = false});

  factory HorizontalBarChart.withSampleData() {
    return HorizontalBarChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final sampleData = [
      PlayerAnalytics(
        totalCorrect: 13,
        totalIncorrect: 2,
        totalQuestions: 15,
        averageTime: 1.22,
        accuracy: 86.67,
        points: 212.0,
        playerId: 62,
        playerName: "TestPlayer2",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer15",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer13",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPwqlayer13",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayerqw13",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer1sg3",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer13q",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer13fd",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer4313",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer16533",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer4567",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer456",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPl33ayer156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlqweayer156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayeewqrr156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayertyj156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayelwdfnr156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 16,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPdsflayer156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TewfdestPlayer156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 14,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayopoer156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 12,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer1iill56",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 31,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer1oooo56",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer15oooopoijil6",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayerfds156",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer15gre6",
      ),
      PlayerAnalytics(
        totalCorrect: 01,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer15ret6",
      ),
      PlayerAnalytics(
        totalCorrect: 19,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer15ertrt6",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 17,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer15te4r6",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 15,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer156ertoeijr",
      ),
      PlayerAnalytics(
        totalCorrect: 11,
        totalIncorrect: 30,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer156kjkj",
      ),
      PlayerAnalytics(
        totalCorrect: 21,
        totalIncorrect: 10,
        totalQuestions: 21,
        averageTime: 5.26,
        accuracy: 52.38,
        points: 163.0,
        playerId: 75,
        playerName: "TestPlayer156ewoiweioi",
      ),
      // Add more sample data as needed
    ];

    final correctData = sampleData.map((player) => OrdinalSales(player.playerName, player.totalCorrect, Colors.green)).toList();
    final incorrectData = sampleData.map((player) => OrdinalSales(player.playerName, player.totalIncorrect, Colors.red)).toList();

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Correct',
        domainFn: (OrdinalSales sales, _) => sales.name,
        measureFn: (OrdinalSales sales, _) => sales.value,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: correctData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Incorrect',
        domainFn: (OrdinalSales sales, _) => sales.name,
        measureFn: (OrdinalSales sales, _) => sales.value,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: incorrectData,
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

/*
// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Bar chart example
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  StackedHorizontalBarChart(this.seriesList, {this.animate = false});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedHorizontalBarChart.withSampleData() {
    return new StackedHorizontalBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory StackedHorizontalBarChart.withRandomData() {
    return new StackedHorizontalBarChart(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final desktopSalesData = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
 */