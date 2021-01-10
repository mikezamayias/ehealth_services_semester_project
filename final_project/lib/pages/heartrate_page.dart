import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:final_project/data/heartrate_data_parser.dart';
import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/services.dart';

class HeartratePage extends StatefulWidget {
  HeartratePage({Key key}) : super(key: key);

  @override
  _HeartratePageState createState() => _HeartratePageState();
}

class _HeartratePageState extends State<HeartratePage> {
  String text = 'Heartrate Data';
  Color baseColor = Colors.red;

  List<ActivitiesHeart> heartrateReadings = [];

  Future<String> _loadJsonHeartrate() async {
    return await rootBundle.loadString(heartrateData['jsonPath']);
  }

  Future loadHeartrateData() async {
    String jsonString = await _loadJsonHeartrate();
    final heartrateData = heartrateDataFromJson(jsonString);
    setState(() {
      heartrateData.activitiesHeart.forEach((reading) {
        heartrateReadings.add(reading);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadHeartrateData();
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
              '${heartrateReadings.length}',
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