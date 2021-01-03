import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/material.dart';

class HeartratePage extends StatefulWidget {
  HeartratePage({Key key}) : super(key: key);

  @override
  _HeartratePageState createState() => _HeartratePageState();
}

class _HeartratePageState extends State<HeartratePage> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      baseColor: Colors.red,
      text: 'Heartrate data',
    );
  }
}
