import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cycle_8_session/core/utils/theme.dart';
import 'package:todo_cycle_8_session/featrues/onboarding/presentation/view/onboarding_screen.dart';

import 'featrues/login/presentation/controller/theme_controller.dart';

void main() {


  String x = "ahmed ehab";
  String date = "2024-06-29 11:53";


  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider()  ,
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(


      theme:AppTheme().lightThemeData ,
       themeMode:Provider.of<ThemeProvider>(context).switchValue == true? ThemeMode.light:ThemeMode.dark,
       darkTheme: AppTheme().darkThemeData ,
       debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
