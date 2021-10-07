import 'package:final_project/constants.dart';
import 'package:final_project/data/sleep_data_parser.dart';
import 'package:final_project/pages/blueprints/chart_page_blueprint.dart';
import 'package:final_project/charts/blueprints/blueprint_line_chart.dart';
import 'package:final_project/charts/chart_legend_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key key}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  String text = 'Sleep Data';
  Color baseColor = Colors.purple;

  List<Sleep> sleepReadings = [];

  List<FlSpot> readings = [];

  Future<String> _loadJsonSleep() async =>
      await rootBundle.loadString(sleepData['jsonPath']);

  Future loadSleepData() async {
    String jsonString = await _loadJsonSleep();
    final List<Sleep> sleepData = List.from(
      sleepDataFromJson(jsonString).sleep.reversed,
    );
    setState(() {
      for (Sleep reading in sleepData) {
        sleepReadings.add(reading);
        readings.add(
          FlSpot(
            sleepData.indexOf(reading).toDouble(),
            reading.minutesAsleep.toDouble() / 60,
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadSleepData();
  }

  @override
  Widget build(BuildContext context) {
    return ChartPageBlueprint(
      text: 'Sleep',
      baseColor: baseColor,
      chart: BlueprintLineChart(
        minY: 5,
        maxY: 12,
        interval: 2.0,
        graphData: {
          'data': readings,
        },
        readingsType: sleepReadings,
        lineColors: [
          baseColor,
        ],
        yLabels: (value) {
          double result = value;
          return '${result.toInt()} h';
        },
      ),
      chartLegendLabels: [
        Expanded(
          child: ChartLegendLabel(
            text: 'Time asleep',
            backgroundColor: baseColor,
            textColor: Colors.grey[200],
          ),
        )
      ],
    );
  }
}
