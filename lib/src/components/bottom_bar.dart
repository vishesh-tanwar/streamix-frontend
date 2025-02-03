import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/screens/create_reel_screen.dart';
import 'package:project/src/screens/home_screen.dart';
import 'package:project/src/screens/profile_screen.dart';
import 'package:project/src/screens/shorts_screen.dart';
import 'package:project/src/screens/subscription_screen.dart';
import '../utils/scale.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int myIndex = 0;

  final List<Widget> widgetList = [
    HomeScreen(),
    ShortsScreen(
      showBackButton: false,
    ),
    CreateReelScreen(),
    SubscriptionScreen(),
    ProfileScreen()
  ];

  final List<IconData> activeIcons = [
    AppIcons.home,
    AppIcons.shorts,
    AppIcons.add,
    AppIcons.subscriptions,
    AppIcons.you,
  ];

  final List<IconData> inactiveIcons = [
    AppIcons.homeFill,
    AppIcons.shortsFill,
    AppIcons.add,
    AppIcons.subscriptionFill,
    AppIcons.youFill,
  ];

  final List<String> labels = ['Home', 'Shorts', '', 'Subscriptions', 'You'];

  @override
  void initState() {
    Scale.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 11.8),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: List.generate(5, (index) {
          return BottomNavigationBarItem(
              icon: Icon(
                myIndex == index ? activeIcons[index] : inactiveIcons[index],
              ),
              label: labels[index]);
        }),
      ),
    );
  }
}
