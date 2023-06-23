import 'package:flutter/material.dart';

class PageBlueprint extends StatefulWidget {
  const PageBlueprint({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  PageBlueprintState createState() => PageBlueprintState();
}

class PageBlueprintState extends State<PageBlueprint> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 18),
        child: Card(
          color: Colors.grey[200],
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
