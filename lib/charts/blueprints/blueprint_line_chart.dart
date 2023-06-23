import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:jiffy/jiffy.dart';

import 'dart:async';

class BlueprintLineChart extends StatefulWidget {
  const BlueprintLineChart({
    Key? key,
    required this.minY,
    required this.maxY,
    required this.interval,
    required this.readingsType,
    required this.graphData,
    required this.lineColors,
    this.yLabels,
  }) : super(key: key);

  final double minY;
  final double maxY;
  final double interval;
  final Function? yLabels;
  final List<dynamic> readingsType;
  final Map<String, List<FlSpot>> graphData;
  final List<Color> lineColors;

  @override
  BlueprintLineChartState createState() => BlueprintLineChartState();
}

class BlueprintLineChartState extends State<BlueprintLineChart> {
  bool _showChart = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _showChart = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showChart
        ? lineChart()
        : Center(
            child: CircularProgressIndicator(
              color: widget.lineColors.last,
            ),
          );
  }

  Widget lineChart() {
    return LineChart(
      LineChartData(
        minY: widget.minY,
        maxY: widget.maxY,
        lineTouchData: lineTouchDataPreferences(),
        gridData: gridDataPreferences(widget.interval / 4),
        titlesData: titlesDataPreferences(),
        backgroundColor: Colors.transparent,
        borderData: borderDataPreferences(),
        clipData: const FlClipData.all(),
        lineBarsData: lineBarsDataPreferences(),
      ),
    );
  }

  List<LineChartBarData> lineBarsDataPreferences() => List.generate(
        widget.graphData.keys.length,
        (index) => LineChartBarData(
          color: widget.lineColors.elementAt(index),
          spots: widget.graphData[widget.graphData.keys.elementAt(index)]!,
          show: true,
          isCurved: true,
          preventCurveOverShooting: false,
          barWidth: 6,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
          ),
        ),
      );

  LineTouchData lineTouchDataPreferences() => LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipRoundedRadius: 20.0,
          tooltipBgColor: Colors.white.withOpacity(0.8),
          showOnTopOfTheChartBoxArea: false,
          fitInsideVertically: true,
          fitInsideHorizontally: true,
        ),
        handleBuiltInTouches: true,
      );

  FlGridData gridDataPreferences(double interval) => FlGridData(
        show: true,
        drawHorizontalLine: true,
        horizontalInterval: interval,
        drawVerticalLine: true,
        verticalInterval: 1.0,
      );

  FlTitlesData titlesDataPreferences() => FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: widget.interval,
            reservedSize: 1.0,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, valuem) {
              try {
                return Text(
                  Jiffy.parseFromDateTime(
                    widget.readingsType[value.toInt()].dateTime,
                  ).format(pattern: 'E\ndd/MM'),
                );
              } catch (e) {
                try {
                  return Text(
                    Jiffy.parseFromDateTime(
                      widget.readingsType[value.toInt()].dateOfSleep,
                    ).format(pattern: 'E\ndd/MM'),
                  );
                } catch (e) {
                  return Text(
                    Jiffy.parseFromDateTime(
                      widget.readingsType[value.toInt()].originalStartTime,
                    ).format(pattern: 'E\ndd/MM'),
                  );
                }
              }
            },
          ),
        ),
      );

  FlBorderData borderDataPreferences() => FlBorderData(
        border: Border.all(
          color: Colors.grey[850]!,
        ),
        show: true,
      );
}
