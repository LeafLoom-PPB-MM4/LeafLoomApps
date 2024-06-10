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
  String _selectedRole = 'user';

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
                      const SizedBox(height: LSizes.sm),
                      // Email Field
                      TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 3, 46, 4),
                            ),
                          ),
                        ),
                        validator: (value) => LValidator.validateEmail(value),
                      ),
                      const SizedBox(height: LSizes.sm),
                      // Phone Number Field
                      TextFormField(
                        controller: controller.phoneNo,
                        decoration: InputDecoration(
                          hintText: 'No. Telepon',
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 3, 46, 4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: LSizes.sm),
                      // Password Field
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle:
                                const TextStyle(color: LColors.lightGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 3, 46, 4),
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.hidePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: LColors.lightGrey,
                              ),
                              onPressed: () {
                                controller.hidePassword.value =
                                    !controller.hidePassword.value;
                              },
                            ),
                          ),
                          validator: (value) =>
                              LValidator.validatePassword(value),
                        ),
                      ),
                      const SizedBox(height: LSizes.sm),
                      // Role Selection Dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedRole,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        items: <String>['user', 'admin']
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRole = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: LSizes.sm),
                      // Privacy Policy Agreement Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeToPrivacyPolicy,
                            onChanged: _togglePrivacyPolicyAgreement,
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: 'Saya setuju dengan ',
                                style: TextStyle(color: LColors.textDark),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Kebijakan Privasi',
                                    style: TextStyle(
                                        color: LColors.primaryNormal,
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle privacy policy tap
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Sign Up Button
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _agreeToPrivacyPolicy
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.registerUser(
                                      controller.email.text,
                                      controller.password.text,
                                      _selectedRole,
                                    );
                                  } else {
                                    Get.snackbar('Error', 'Form tidak valid');
                                  }
                                }
                              : null,
                          child: const Text('Daftar'),
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
