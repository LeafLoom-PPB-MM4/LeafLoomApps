import 'package:flutter/material.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/forgot_password_screen.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:leafloom/features/authentication/screens/signup/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeaFloom',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: OnBoardingScreen(),
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/forgot-pass': (context) => ForgotPassScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
