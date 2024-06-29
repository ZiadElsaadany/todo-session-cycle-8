import 'package:flutter/material.dart';
import 'package:todo_cycle_8_session/featrues/onboarding/presentation/view/onboarding_screen.dart';

void main() {


  String x = "ahmed ehab";
  String date = "2024-06-29 11:53";


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
