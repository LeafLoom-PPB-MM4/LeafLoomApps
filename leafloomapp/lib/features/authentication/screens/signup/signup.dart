import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leafloom/common/styles/spacing_styles.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/sizes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                        style: Theme.of(context).textTheme.headlineLarge,
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
                    child: Text(
                      'Daftar ke Aplikasi LeafLoom',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                // Sign Up Form
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name Field
                      TextFormField(
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
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 3, 46, 4),
                            ),
                          ),
                          hintText: 'Kata Sandi',
                          hintStyle: const TextStyle(color: LColors.lightGrey),
                        ),
                      ),
                      const SizedBox(height: LSizes.inputFieldRadius),

                      // Confirm Password Field
                      TextFormField(
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
                                    style: const TextStyle(
                                      color: LColors.primary,
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
                          onPressed: _agreeToPrivacyPolicy
                              ? () {
                                  // Tambahkan logika untuk tombol daftar
                                }
                              : null,
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
