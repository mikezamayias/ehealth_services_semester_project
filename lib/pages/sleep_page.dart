import 'package:final_project/constants.dart';
import 'package:final_project/data/sleep_data_parser.dart';
import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SleepPage extends StatefulWidget {
  SleepPage({Key key}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  String text = 'Sleep Data';
  Color baseColor = Colors.purple;

  List<Sleep> sleepReadings = [];

  Future<String> _loadJsonSleep() async {
    return await rootBundle.loadString(sleepData['jsonPath']);
  }

  Future laodSleepData() async {
    String jsonString = await _loadJsonSleep();
    final sleepData = sleepDataFromJson(jsonString);
    setState(() {
      sleepData.sleep.forEach((reading) {
        sleepReadings.add(reading);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    laodSleepData();
  }


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
              '${sleepReadings.length}',
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
