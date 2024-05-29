import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:leafloom/common/styles/spacing_styles.dart';
import 'package:leafloom/features/authentication/controllers.onboarding/log_in_controller.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/forgot_password_screen.dart';
import 'package:leafloom/features/authentication/screens/signup/signup.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/constants/sizes.dart';
import 'package:leafloom/utils/constants/text_strings.dart';
import 'package:leafloom/navigation_menu.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';
import 'package:leafloom/widget/global_text_field_widget.dart';
import '../../../../widget/validation.dart';
import '../../controllers.onboarding/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _remindMe = false;
  final _formKey = GlobalKey<FormState>(); // Tambahkan GlobalKey<FormState>

  void _toggleRemindMe(bool? value) {
    setState(() {
      _remindMe = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: LSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: LSizes.md),
                      Text(
                        'Selamat Datang Kembali!',
                        style: LTextTheme.latoBold24.copyWith(
                          color: LColors.textDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
                Form(
                  key: _formKey, // Tambahkan GlobalKey<FormState> di sini
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
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => LValidator.validateEmail(value),
                        decoration: InputDecoration(
                          hintText: 'Masukkan Email Anda',
                          hintStyle: TextStyle(color: LColors.lightGrey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: false,
                        ),
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
                      TextFormField(
                        controller: controller.password,
                        validator: (value) =>
                            LValidator.validatePassword(value),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Kata Sandi Anda',
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              IconsConstant.hide,
                              color: LColors.lightGrey,
                            ),
                            onPressed: () {},
                          ),
                          hintStyle: TextStyle(color: LColors.lightGrey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: false,
                        ),
                      ),
                      const SizedBox(height: 20),
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
                              Get.offAll(() => ForgotPassScreen());
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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              LoginController.instance.loginUser(
                                controller.email.text.trim(),
                                controller.password.text.trim(),
                              );
                            }
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Belum punya akun?',
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offAll(() => SignUpScreen());
                            },
                            child: Text(
                              'Daftar',
                              style: LTextTheme.latoSemiBold14.copyWith(
                                color: LColors.primaryNormal,
                              ),
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
