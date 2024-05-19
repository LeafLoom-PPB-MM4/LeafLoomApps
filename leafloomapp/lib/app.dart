import 'package:flutter/material.dart';
import 'package:leafloom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:leafloom/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: LAppTheme.lightTheme,
      darkTheme: LAppTheme.darkTheme,
      home: OnBoardingScreen(),
    );
  }
}
