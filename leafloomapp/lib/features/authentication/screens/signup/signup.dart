import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/common/styles/spacing_styles.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/sizes.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';
import 'package:leafloom/widget/validation.dart';

import '../../controllers.onboarding/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _agreeToPrivacyPolicy = false;

  void _togglePrivacyPolicyAgreement(bool? value) {
    setState(() {
      _agreeToPrivacyPolicy = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: LSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome title
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: LSizes.md),
                      child: Text(
                        'Selamat Datang di LeafLoom!',
                        style: LTextTheme.latoBold24.copyWith(
                          color: LColors.textDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: LSizes.xl,
                ),
                // Sign Up prompt
                Padding(
                  padding: const EdgeInsets.only(bottom: LSizes.md),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Daftar ke Aplikasi LeafLoom',
                        style: LTextTheme.latoMedium18.copyWith(
                          color: LColors.textDark,
                        )),
                  ),
                ),
                // Sign Up Form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name Field
                      TextFormField(
                        controller: controller.fullName,
                        decoration: InputDecoration(
                          hintText: 'Nama Lengkap',
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 3, 46, 4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: LSizes.inputFieldRadius),

                      // Email Field
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => LValidator.validateEmail(value),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 3, 46, 4),
                            ),
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                        ),
                      ),
                      const SizedBox(height: LSizes.inputFieldRadius),

                      // Phone Number Field
                      TextFormField(
                        controller: controller.phoneNo,
                        validator: (value) =>
                            LValidator.validatePhoneNumber(value),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 3, 46, 4),
                            ),
                          ),
                          hintText: 'Nomor Telepon',
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                        ),
                      ),
                      const SizedBox(height: LSizes.inputFieldRadius),

                      // Password Field
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          validator: (value) =>
                              LValidator.validatePassword(value),
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(controller.hidePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                controller.hidePassword.value =
                                    !controller.hidePassword.value;
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 3, 46, 4),
                              ),
                            ),
                            hintText: 'Kata Sandi',
                            hintStyle:
                                const TextStyle(color: LColors.lightGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: LSizes.inputFieldRadius),

                      // Confirm Password Field
                      TextFormField(
                        controller: controller.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 3, 46, 4),
                            ),
                          ),
                          hintText: 'Konfirmasi Kata Sandi',
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                        ),
                      ),

                      // Privacy Policy Agreement
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeToPrivacyPolicy,
                            onChanged: _togglePrivacyPolicyAgreement,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'Dengan Melanjutkan, Anda Menyetujui ',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Kebijakan Privasi',
                                    style: TextStyle(
                                      color: LColors.primaryNormal,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Tambahkan logika untuk menampilkan kebijakan privasi
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: LSizes.spaceBtwItems,
                      ),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("Button pressed. Registering user...");
                              SignUpController.instance.registerUser(
                                controller.email.text.trim(),
                                controller.password.text.trim(),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 2, 58, 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
