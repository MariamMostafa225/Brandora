import 'package:flutter/material.dart';
import 'package:winterproject/screens/onboarding_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brandora App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      // هنا بننادي على الشاشة اللي عملناها
      home: const OnboardingMain(),
    );
  }
}