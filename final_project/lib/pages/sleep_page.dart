import 'package:final_project/constants.dart';
import 'package:final_project/data/sleep_data_parser.dart';
import 'package:final_project/pages/blueprints/chart_page_blueprint.dart';
import 'package:final_project/charts/blueprints/blueprint_line_chart.dart';
import 'package:final_project/charts/chart_legend_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';

class SleepPage extends StatefulWidget {
  SleepPage({Key key}) : super(key: key);

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
      sleepData.forEach((reading) {
        sleepReadings.add(reading);
        readings.add(
          FlSpot(
            sleepData.indexOf(reading).toDouble(),
            reading.minutesAsleep.toDouble(),
          ),
        );
      });
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
        minY: 300,
        maxY: 700,
        interval: 100.0,
        graphData: {
          'data': readings,
        },
        readingsType: sleepReadings,
        lineColors: [
          baseColor,
        ],
        yLabels: (value) {
          double result = value / 60;
          return '${result.toInt()} h';
        },
      ),
      chartLegendLabels: [
        Expanded(
          child: ChartLegendLabel(
            text: 'Duration asleep',
            backgroundColor: baseColor,
            textColor: Colors.grey[200],
          ),
        )
      ],
    );
  }
}
