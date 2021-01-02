import 'package:flutter/material.dart';

class HeartratePage extends StatefulWidget {
  HeartratePage({Key key}) : super(key: key);

  @override
  _HeartratePageState createState() => _HeartratePageState();
}

class _HeartratePageState extends State<HeartratePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Heartrate data',
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
