import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_main.dart';
import 'screens/login_screen.dart';

void main() async {// علشان هنقرأ بيانات من الجهاز 
  WidgetsFlutterBinding.ensureInitialized();// ده لازم علشان SharedPreferences

  final prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {

  final bool seenOnboarding;

  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brandora App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: seenOnboarding
          ? const LoginScreen()
          : const OnboardingMain(),
    );
  }
}