import 'dart:io';

import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/material.dart';

class HeartratePage extends StatefulWidget {
  HeartratePage({Key key}) : super(key: key);

  @override
  _HeartratePageState createState() => _HeartratePageState();
}

class _HeartratePageState extends State<HeartratePage> {
  final heartrateData =
      File('package:final_project/data/read_data.dart').readAsStringSync();

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      baseColor: Colors.red,
      text: heartrateData,
    );
  }
}
