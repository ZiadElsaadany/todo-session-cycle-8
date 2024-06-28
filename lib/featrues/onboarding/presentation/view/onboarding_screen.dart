import 'package:flutter/material.dart';
import 'package:todo_cycle_8_session/featrues/onboarding/presentation/view/widgets/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  OnboardingBody(),
    );
  }
}
