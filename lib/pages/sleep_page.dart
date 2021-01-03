import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/material.dart';

class SleepPage extends StatefulWidget {
  SleepPage({Key key}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      baseColor: Colors.purple,
      text: 'Sleep data',
    );
  }
}
