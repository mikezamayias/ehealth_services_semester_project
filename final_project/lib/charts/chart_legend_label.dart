import 'package:flutter/material.dart';

class ChartLegendLabel extends StatelessWidget {
  const ChartLegendLabel({
    Key key,
    @required this.text,
    @required this.backgroundColor,
    @required this.textColor,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shadowColor: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
