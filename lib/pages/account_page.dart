import 'package:final_project/constants.dart';
import 'package:final_project/data/account_data_parser.dart';
import 'package:final_project/pages/page_blueprint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String text = 'Account Data';
  Color baseColor = Colors.blue;

  User profile = new User();

  Future<String> _loadJsonAccount() async {
    return await rootBundle.loadString(accountData['jsonPath']);
  }

  Future loadAccountData() async {
    String jsonString = await _loadJsonAccount();
    final accountData = accountDataFromJson(jsonString);
    setState(() {
      profile.age = accountData.user.age;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAccountData();
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
              // '${accountReadings.dateOfBirth()}',
              '${account.fullName}',
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
