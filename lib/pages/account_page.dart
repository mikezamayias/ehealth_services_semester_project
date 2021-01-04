import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      baseColor: Colors.blue,
      text: 'Account data',
    );
  }
}
