import 'package:flutter/material.dart';

class PageBlueprint extends StatefulWidget {
  const PageBlueprint({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _PageBlueprintState createState() => _PageBlueprintState();
}

class _PageBlueprintState extends State<PageBlueprint> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 38.0, 8.0, 11.0),
        child: Card(
          color: Colors.grey[200],
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
