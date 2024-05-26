import 'package:flutter/material.dart';
import 'package:leafloom/common/styles/spacing_styles.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/forgot_password_screen.dart';
import 'package:leafloom/features/authentication/widget/global_text_field_widget.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/constants/sizes.dart';
import 'package:leafloom/utils/constants/text_strings.dart';
import 'package:leafloom/navigation_menu.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  String? _emailErrorText;
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  String? _passwordErrorText;
  bool _remindMe = false;

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _emailController.dispose();
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateEmail(String value) {
    setState(() {
      _emailErrorText =
          value.isNotEmpty && value.contains('@') ? null : 'Email tidak valid';
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _passwordErrorText = value.isNotEmpty && value.length >= 6
          ? null
          : 'Kata sandi harus minimal 6 karakter';
    });
  }

  void _toggleRemindMe(bool? value) {
    setState(() {
      _remindMe = value ?? false;
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
                        style: Theme.of(context).textTheme.headlineLarge,
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
                      const SizedBox(height: 28),
                      SizedBox(
                        height: 20,
                        child: Text(
                          'Email',
                          style: LTextTheme.latoSemiBold16.copyWith(
                            color: LColors.textNormal,
                          ),
                        ),
                      ),
                      GlobalTextFieldWidget(
                        focusNode: _emailFocusNode,
                        controller: _emailController,
                        errorText: _emailErrorText,
                        hintText: 'Masukkan Email Anda',
                        prefixIcon: IconsConstant.email,
                        showSuffixIcon: false,
                        onChanged: (value) => _validateEmail(value),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 20,
                        child: Text(
                          'Kata Sandi',
                          style: LTextTheme.latoSemiBold16.copyWith(
                            color: LColors.textNormal,
                          ),
                        ),
                      ),

                      // Password Field
                      GlobalTextFieldWidget(
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        errorText: _passwordErrorText,
                        hintText: 'Masukkan Kata Sandi Anda',
                        prefixIcon: IconsConstant.lock,
                        showSuffixIcon: true,
                        onChanged: (value) => _validatePassword(value),
                      ),
                      const SizedBox(height: 20),

                      // Remember Me and Forgot Password Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Checkbox(
                                value: _remindMe,
                                onChanged: (bool? newValue) {
                                  _toggleRemindMe(newValue);
                                },
                                checkColor: LColors.white,
                                activeColor: LColors.primaryNormal,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                side: BorderSide(
                                  color: LColors.primaryNormal,
                                  width: 2,
                                ),
                              ),
                              Text(
                                'Ingatkan Saya',
                                style: LTextTheme.latoReguler14,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot-pass');
                            },
                            child: Text(
                              'Lupa Kata Sandi',
                              style: LTextTheme.latoReguler14.copyWith(
                                color: LColors.primaryNormal,
                              ),
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationMenu()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 3, 79, 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
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
                            side: const BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
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
                              const Text(
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
                          const Text(
                            'Belum punya akun?',
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text(
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
