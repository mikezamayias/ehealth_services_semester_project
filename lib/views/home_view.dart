import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project/pages/account_page.dart';
import 'package:final_project/pages/activity_page.dart';
import 'package:final_project/pages/heartrate_page.dart';
import 'package:final_project/pages/sleep_page.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int pageIndex = 3;

  Widget _pageController(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const HeartratePage();
      case 1:
        return const ActivityPage();
      case 2:
        return const SleepPage();
      case 3:
        return const AccountPage();
      default:
        return const AccountPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.grey[200]!,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Colors.grey[200]!,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOutCubic,
          animationDuration: const Duration(milliseconds: 400),
          index: pageIndex,
          onTap: (int iconIndex) {
            setState(() {
              pageIndex = iconIndex;
            });
          },
          items: <Widget>[
            Icon(
              Icons.favorite_rounded,
              color: Colors.red[600]!,
            ),
            const Icon(
              Icons.directions_run_rounded,
              color: Colors.green,
            ),
            const Icon(
              Icons.hotel,
              color: Colors.purple,
            ),
            const Icon(
              Icons.account_box_rounded,
              color: Colors.blue,
            ),
          ],
        ),
        body: Container(
          color: Colors.transparent,
          child: _pageController(pageIndex),
        ),
      ),
    );
  }
}
