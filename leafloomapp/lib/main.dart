import 'package:flutter/material.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/features/authentication/screens/signup/signup.dart';
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
      home: LoginScreen(),
      routes: {
        '/signup': (context) => SignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
