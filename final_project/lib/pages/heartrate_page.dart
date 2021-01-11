import 'package:final_project/charts/blueprints/blueprint_line_chart.dart';
import 'package:final_project/charts/chart_legend_label.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:final_project/data/heartrate_data_parser.dart';
import 'package:flutter/services.dart';
import 'blueprints/chart_page_blueprint.dart';

class HeartratePage extends StatefulWidget {
  HeartratePage({Key key}) : super(key: key);

  @override
  _HeartratePageState createState() => _HeartratePageState();
}

class _HeartratePageState extends State<HeartratePage> {
  String text = 'Heartrate Data';
  Color baseColor = Colors.red[700];

  List<ActivitiesHeart> heartrateReadings = [];

  List<FlSpot> readingsMax = [];
  List<FlSpot> readingsAve = [];
  List<FlSpot> readingsMin = [];

  Future<String> _loadJsonHeartrate() async =>
      await rootBundle.loadString(heartrateData['jsonPath']);

  Future loadHeartrateData() async {
    String jsonString = await _loadJsonHeartrate();
    final List<ActivitiesHeart> heartrateData = List.from(
      heartrateDataFromJson(jsonString).activitiesHeart.reversed,
    );
    setState(() {
      for (ActivitiesHeart heartActivity in heartrateData) {
        heartrateReadings.add(heartActivity);
        readingsMax.add(
          FlSpot(
            heartrateData.indexOf(heartActivity).toDouble(),
            heartActivity.maxValue.toDouble(),
          ),
        );
        readingsMin.add(
          FlSpot(
            heartrateData.indexOf(heartActivity).toDouble(),
            heartActivity.minValue.toDouble(),
          ),
        );
        readingsAve.add(
          FlSpot(
            heartrateData.indexOf(heartActivity).toDouble(),
            heartActivity.aveValue.toDouble(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadHeartrateData();
  }

  @override
  Widget build(BuildContext context) {
    return ChartPageBlueprint(
      text: 'Heartrate',
      baseColor: Colors.red[900],
      chart: BlueprintLineChart(
        minY: 30.0,
        maxY: 140.0,
        interval: 10,
        graphData: {
          'min': readingsMin,
          'ave': readingsAve,
          'max': readingsMax,
        },
        readingsType: heartrateReadings,
        lineColors: [
          Colors.blue,
          Colors.amber,
          baseColor,
        ],
      ),
      chartLegendLabels: [
        Expanded(
          child: ChartLegendLabel(
            text: 'Minimum',
            backgroundColor: Colors.blue,
            textColor: Colors.grey[200],
          ),
        ),
        Expanded(
          child: ChartLegendLabel(
            text: 'Average',
            backgroundColor: Colors.amber,
            textColor: Colors.grey[850],
          ),
        ),
        Expanded(
          child: ChartLegendLabel(
            text: 'Maximum',
            backgroundColor: baseColor,
            textColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
