import 'file:///C:/Users/szama/StudioProjects/temp/lib/pages/blueprints/page_blueprint.dart';
import 'package:flutter/material.dart';

class ChartPageBlueprint extends StatelessWidget {
  const ChartPageBlueprint({
    Key key,
    @required this.text,
    @required this.baseColor,
    @required this.chart,
    @required this.chartLegendLabels,
  }) : super(key: key);

  final String text;
  final Color baseColor;
  final Widget chart;
  final List<Widget> chartLegendLabels;

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                color: baseColor,
                shadowColor: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: chart,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: chartLegendLabels,
            ),
          )
        ],
      ),
    );
  }
}
