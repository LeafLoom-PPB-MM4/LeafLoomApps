import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/otp_screen.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

import '../../../../widget/global_button_widget.dart';
import '../../../../widget/global_text_field_widget.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final FocusNode _focusNode = FocusNode();
  final _controller = TextEditingController();
  String? _errorText;
  bool remindMe = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Lupa Kata Sandi',
            style: LTextTheme.latoBold20,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: IconButton(
              icon: SvgPicture.asset(
                IconsConstant.arrowLeft,
                color: LColors.primaryNormal,
              ),
              iconSize: 24,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: 16, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lupa Kata Sandi?",
                      style: LTextTheme.latoBold24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Jangan khawatir! Masukkan nomor telepon yang Anda daftarkan untuk membuat akun. Kami akan mengirimkan kode OTP ke nomor tersebut.",
                      style: LTextTheme.latoReguler14,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Text(
                      'Nomor Telepon',
                      style: LTextTheme.latoSemiBold14.copyWith(
                        color: LColors.textDark,
                      ),
                    ),
                  ),
                  GlobalTextFieldWidget(
                    focusNode: _focusNode,
                    controller: _controller,
                    errorText: _errorText,
                    hintText: 'Masukkan Email Anda',
                    prefixIcon: IconsConstant.email,
                    showSuffixIcon: false,
                  ),
                  const SizedBox(height: 27),
                  GlobalButtonWidget(
                    text: 'Kirim Tautan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
