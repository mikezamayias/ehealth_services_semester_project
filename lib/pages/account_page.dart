import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy/jiffy.dart';

import '../constants.dart';
import '../data/account_parser.dart';
import '../views/profile/profile_image_view.dart';
import '../views/profile/profile_text_view.dart';
import 'blueprints/page_blueprint.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String text = 'Account Data';
  Color baseColor = Colors.blue;

  User profile = User();

  String avatarURL;
  String fullName;
  String dateOfBirth;
  String age;

  Future<String> _loadJsonAccount() async {
    return await rootBundle.loadString(accountData['jsonPath']);
  }

  Future loadAccountData() async {
    String jsonString = await _loadJsonAccount();
    final accountData = accountDataFromJson(jsonString);
    setState(() {
      profile = accountData.user;
      avatarURL = profile.avatar640;
      fullName = profile.fullName;
      dateOfBirth = Jiffy(profile.dateOfBirth).yMMMMd;
      age = '${profile.age}';
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
      child: Align(
        alignment: Alignment.center,
        child: Card(
          shadowColor: Colors.transparent,
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Expanded(
                  flex: 1,
                  child: Card(
                    color: Colors.blue,
                    shadowColor: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                ProfileImageView(
                  text: 'Picture',
                  data: avatarURL,
                ),
                ProfileTextView(
                  text: 'Full name',
                  data: fullName,
                ),
                ProfileTextView(
                  text: 'Birth date',
                  data: dateOfBirth,
                ),
                ProfileTextView(
                  text: 'Age',
                  data: age,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
