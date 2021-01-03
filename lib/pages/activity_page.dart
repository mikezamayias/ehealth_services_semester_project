import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      baseColor: Colors.green,
      text: 'Activity data',
    );
  }
}
