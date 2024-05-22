import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leafloom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:leafloom/navigation_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final bool? onboardingCompleted = prefs.getBool('onboarding');

      if (onboardingCompleted == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavigationMenu()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logos/appLogo.png'),
      ),
    );
  }
}
