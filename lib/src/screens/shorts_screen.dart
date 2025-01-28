import 'package:flutter/material.dart';
import 'package:project/src/components/bottom_bar.dart';

class ShortsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'shorts here',
        style: TextStyle(color: Colors.black),
      )),
      bottomNavigationBar: BottomBar(),
    );
  }
}
