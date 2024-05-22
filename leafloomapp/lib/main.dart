import 'package:flutter/material.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:leafloom/features/authentication/screens/onboarding/splash.dart';
import 'package:leafloom/features/authentication/screens/signup/signup.dart';
import 'package:leafloom/features/shop/screens/home/home.dart';
import 'package:leafloom/features/shop/screens/profile/profile.dart';
import 'package:leafloom/features/shop/screens/shop/produk.dart';
// Import the SignUpScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeaFloom',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      routes: {
        '/signup': (context) => SignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
