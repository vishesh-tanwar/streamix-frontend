import 'package:flutter/material.dart';
import 'package:project/src/screens/profile_screen.dart';
import 'package:project/src/screens/shorts_screen.dart';
import 'package:project/src/utils/keys.dart';
import 'src/screens/home_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Keys.navigatorKey,
      initialRoute: '/', 
      routes: {
        '/': (context) => const HomeScreen(),
        '/shorts' : (context) => ShortsScreen() ,
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
} 