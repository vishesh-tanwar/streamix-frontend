import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/firebase_options.dart';
import 'package:project/src/components/bottom_bar.dart';
import 'package:project/src/utils/keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // for firebase line (8 - 11)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      const ProviderScope(child: MyApp())); // added provide scope for riverpod
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
