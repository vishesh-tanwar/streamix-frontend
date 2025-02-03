import 'package:flutter/material.dart';
import 'package:project/src/components/bottom_bar.dart';
import 'package:project/src/utils/keys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      navigatorKey: Keys.navigatorKey,
      routes: {
        '/': (context) => const BottomBar(),
      },
    );
  }
}
