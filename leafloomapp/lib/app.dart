import 'package:flutter/material.dart';
import 'package:leafloom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:leafloom/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/forgot_password_screen.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/features/authentication/screens/signup/signup.dart';

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
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/forgot-pass': (context) => ForgotPassScreen(),
      },
    );
  }
}
