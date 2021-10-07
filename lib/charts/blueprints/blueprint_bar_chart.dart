import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BlueprintBarChart extends StatelessWidget {
  const BlueprintBarChart({
    Key key,
    @required this.readings,
    @required this.barData,
  }) : super(key: key);

  final List<dynamic> readings;
  final List<BarChartGroupData> barData;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 130,
        minY: 30,
        alignment: BarChartAlignment.spaceBetween,
        barTouchData: BarTouchData(
          enabled: true,
        ),
        barGroups: barData,
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[850],
              width: 3,
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
        ),
        axisTitleData: FlAxisTitleData(
          show: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          leftTitles: SideTitles(
            showTitles: true,
          ),
          bottomTitles: SideTitles(
            showTitles: true,
          ),
        ),
      ),
    );
  }
}
