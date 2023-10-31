import 'package:flutter/material.dart';
import 'package:plantapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Plant APP',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
