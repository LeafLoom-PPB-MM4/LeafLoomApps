import 'package:flutter/material.dart';
import 'package:leafloom/common/styles/spacing_styles.dart';
import 'package:leafloom/features/authentication/screens/signup/signup.dart';
import 'package:leafloom/navigation_menu.dart';
import 'package:leafloom/utils/constants/colors.dart';

import 'package:leafloom/utils/constants/sizes.dart';
import 'package:leafloom/utils/constants/text_strings.dart'; // Import the SignUpScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleRememberMe(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: LSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome back title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: LSizes.md),
                      Text(
                        'Selamat Datang Kembali!',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),

                // Form
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email/Phone Number Field
                      const Text('Email/Nomor Telepon',
                          style: TextStyle(
                              color: LColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: LSizes.inputFieldRadius,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: LColors.lightGrey)),
                          hintText: LText.email,
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                        ),
                      ),
                      const SizedBox(height: LSizes.spaceBtwInputFields),

                      // Password Field
                      const Text('Kata Sandi',
                          style: TextStyle(
                              color: LColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: LSizes.inputFieldRadius,
                      ),
                      TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 3, 46, 4))),
                          hintText: LText.password,
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),

                      // Remember Me and Forgot Password Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: _toggleRememberMe,
                              ),
                              const Text(
                                LText.rememberMe,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Tambahkan logika untuk lupa kata sandi
                            },
                            child: Text(
                              LText.forgetPassword,
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: LSizes.spaceBtwItems,
                      ),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika untuk navigasi ke NavigationMenu
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationMenu()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 3, 79, 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            LText.signIn,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // Divider

                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'atau',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      // Sign in with Google Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            // Tambahkan logika untuk tombol masuk dengan Google
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Sesuaikan dengan radius yang diinginkan
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/logos/googleLogo.png',
                                height: 24.0,
                                width: 24.0,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                'Masuk dengan Google',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Don't have an account? Sign Up text

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun?',
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
                            },
                            child: Text(
                              'Daftar',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
