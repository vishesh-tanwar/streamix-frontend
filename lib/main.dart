import 'package:flutter/material.dart';
import 'package:project/src/utils/keys.dart';
import 'src/screens/home_screen.dart'; 

// late Size mq ;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size ; 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(), navigatorKey: Keys.navigatorKey,
    );
  }
} 