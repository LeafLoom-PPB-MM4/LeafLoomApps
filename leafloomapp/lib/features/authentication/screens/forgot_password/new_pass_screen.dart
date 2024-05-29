import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/utils/constants/image_strings.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';
import '../../../../widget/global_button_widget.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              SvgPicture.asset(
                LImages.success,
                height: 160,
                width: 240,
              ),
              const SizedBox(height: 24),
              Text(
                "Kata Sandi Berhasil Diubah!",
                style: LTextTheme.latoBold24,
              ),
              const SizedBox(height: 8),
              Text(
                "Akun Anda sudah dapat digunakan untuk melakukan transaksi. Silakan masuk dengan menggunakan kata sandi baru Anda.",
                style: LTextTheme.latoMedium16,
              ),
              const SizedBox(height: 40),
              GlobalButtonWidget(
                text: 'Masuk',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
