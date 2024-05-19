import 'package:flutter/material.dart';
import 'package:leafloom/common/styles/spacing_styles.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: LSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Welcome title
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: LSizes.md),
                  child: Text(
                    'Selamat datang di LeaFloom!',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Sign Up prompt
              Padding(
                padding: const EdgeInsets.only(bottom: LSizes.md),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Daftar ke Aplikasi LeaFloom',
                    style: Theme.of(context).textTheme.subtitle1,
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
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 3, 46, 4)))),
                    ),
                    const SizedBox(height: LSizes.spaceBtwInputFields),

                    // Email Field
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 3, 46, 4))),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: LSizes.spaceBtwInputFields),

                    // Phone Number Field
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 3, 46, 4))),
                        labelText: 'Nomor Telepon',
                      ),
                    ),
                    const SizedBox(height: LSizes.spaceBtwInputFields),

                    // Password Field
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 3, 46, 4))),
                        labelText: 'Kata Sandi',
                      ),
                    ),
                    const SizedBox(height: LSizes.spaceBtwInputFields),

                    // Confirm Password Field
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 3, 46, 4))),
                        labelText: 'Konfirmasi Kata Sandi',
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
                          child: Text(
                            'Dengan melanjutkan, Anda menyetujui kebijakan privasi',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _agreeToPrivacyPolicy
                            ? () {
                                // Tambahkan logika untuk tombol daftar
                              }
                            : null, // Disable button if not agreed to privacy policy
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 2, 58, 4),
                        ),
                        child: Text(
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
    );
  }
}
