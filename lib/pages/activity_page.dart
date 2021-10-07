import 'package:final_project/constants.dart';
import 'package:final_project/data/activity_data_parser.dart';
import 'package:final_project/pages/blueprints/chart_page_blueprint.dart';
import 'package:final_project/charts/blueprints/blueprint_line_chart.dart';
import 'package:final_project/charts/chart_legend_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String text = 'Activity Data';
  Color baseColor = Colors.green;

  List<Activity> activityReadings = [];

  List<FlSpot> stepsData = [];
  List<FlSpot> caloriesData = [];

  Future<String> _loadJsonActivity() async =>
      await rootBundle.loadString(activityData['jsonPath']);

  Future loadActivityData() async {
    String jsonString = await _loadJsonActivity();
    final List<Activity> activityData = List.from(
      activityDataFromJson(jsonString).activities.reversed,
    );
    setState(() {
      for (Activity activity in activityData) {
        activityReadings.add(activity);
        stepsData.add(
          FlSpot(
            activityData.indexOf(activity).toDouble(),
            activity.steps.toDouble(),
          ),
        );
        caloriesData.add(
          FlSpot(
            activityData.indexOf(activity).toDouble(),
            activity.calories.toDouble() / 100,
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadActivityData();
  }

  @override
  Widget build(BuildContext context) {
    return ChartPageBlueprint(
      text: 'Activity',
      baseColor: baseColor,
      chart: BlueprintLineChart(
        minY: 0,
        maxY: 5000,
        interval: 1000,
        readingsType: activityReadings,
        graphData: {
          'steps': stepsData,
          'calories': caloriesData,
        },
        lineColors: [
          baseColor,
          Colors.amber,
        ],
      ),
      chartLegendLabels: [
        Expanded(
          child: ChartLegendLabel(
            text: 'Steps',
            backgroundColor: baseColor,
            textColor: Colors.grey[200],
          ),
        ),
        Expanded(
          flex: 2,
          child: ChartLegendLabel(
            text: 'Calories in 10*kcal units',
            backgroundColor: Colors.amber,
            textColor: Colors.grey[850],
          ),
        )
      ],
    );
  }
}
