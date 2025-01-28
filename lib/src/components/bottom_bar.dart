import 'package:flutter/material.dart';
import 'package:project/src/utils/scale.dart';
import '../assets/strings.dart';
import '../assets/icons.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);

  final List<String> titles = [
    Strings.home,
    Strings.shorts,
    "",
    Strings.subscriptions,
    Strings.you
  ];
  final List<IconData> icons = [
    AppIcons.home,
    AppIcons.shorts,
    AppIcons.add,
    AppIcons.subscriptions,
    AppIcons.you
  ];

  final List<String> routes = [
    '/',
    '/shorts',
    '',
    '/subscriptions',
    '/profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Scale.screenHeight * 0.07,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (index) {
          // Handle Add button separately
          if (titles[index].isEmpty) {
            return IconButton(
              icon: Icon(
                icons[index],
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Add button pressed")),
                );
              },
            );
          }

          // For other icons with navigation
          return GestureDetector(
            onTap: () {
              if (routes[index].isNotEmpty) {
                Navigator.pushNamed(context, routes[index]);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons[index],
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(height: Scale.screenHeight * 0.006),
                Text(
                  titles[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
