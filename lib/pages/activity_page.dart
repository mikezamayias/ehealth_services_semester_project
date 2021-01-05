import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String text = 'Activity Data';
  Color baseColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      baseColor: baseColor,
      child: Align(
        alignment: Alignment.center,
        child: Card(
          shadowColor: Colors.transparent,
          color: baseColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
