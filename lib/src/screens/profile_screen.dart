import 'package:flutter/material.dart';
import 'package:project/src/components/bottom_bar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Center(child: Text("Welcome to the Profile Page!")),
      bottomNavigationBar: BottomBar(),
    );
  }
}
