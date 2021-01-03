import 'package:flutter/material.dart';

class PageBlueprint extends StatefulWidget {
  const PageBlueprint({
    Key key,
    @required this.baseColor,
    @required this.text,
  }) : super(key: key);

  final Color baseColor;
  final String text;

  @override
  _PageBlueprintState createState() => _PageBlueprintState();
}

class _PageBlueprintState extends State<PageBlueprint> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
        child: Card(
          elevation: 5.0,
          shadowColor: Colors.grey[200],
          color: widget.baseColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              shadowColor: Colors.grey[200],
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Card(
                  shadowColor: Colors.grey[200],
                  elevation: 5.0,
                  color: widget.baseColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
