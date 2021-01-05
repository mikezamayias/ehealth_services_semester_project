import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project/pages/account_page.dart';
import 'package:final_project/pages/activity_page.dart';
import 'package:final_project/pages/heartrate_page.dart';
import 'package:final_project/pages/sleep_page.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 3;

  Widget _pageController(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return HeartratePage();
        break;
      case 1:
        return ActivityPage();
        break;
      case 2:
        return SleepPage();
        break;
      case 3:
        return AccountPage();
        break;
      default:
        return AccountPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Colors.grey[200],
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOutCubic,
        animationDuration: Duration(milliseconds: 400),
        index: pageIndex,
        onTap: (int iconIndex) {
          setState(() {
            pageIndex = iconIndex;
          });
        },
        items: <Widget>[
          Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),
          Icon(
            Icons.directions_run_rounded,
            color: Colors.green,
          ),
          Icon(
            Icons.hotel,
            color: Colors.purple,
          ),
          Icon(
            Icons.account_box_rounded,
            color: Colors.blue,
          ),
        ],
      ),
      body: Container(
        color: Colors.transparent,
        child: _pageController(pageIndex),
      ),
    );
  }
}
