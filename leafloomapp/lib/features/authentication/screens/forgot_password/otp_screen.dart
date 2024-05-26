import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/confirmation_screen.dart';
import 'package:leafloom/features/authentication/widget/global_button_widget.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masukkan Kode OTP",
                style: LTextTheme.latoBold24,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "Untuk mengkonfirmasi nomor telepon Anda, harap masukkan kode OTP yang dikirim melalui nomor telepon",
                style: LTextTheme.latoReguler16,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "+6282*******03",
                style: LTextTheme.latoSemiBold16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 26,
              ),
              CustomPinCodeTextField(
                onChanged: (String value) {},
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 8),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              GlobalButtonWidget(
                text: 'Lanjutkan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmPassScreen(),
                    ),
                  );
                },
              ),
              GlobalButtonWidget(
                text: 'Kirim Ulang',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmPassScreen(),
                    ),
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

class CustomPinCodeTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomPinCodeTextField({
    Key? key,
    required this.onChanged,
    final Duration? animationDuration,
    final BuildContext? appContext,
    final int? length,
    final TextInputType? keyboardType,
    final bool? enableActiveFill,
    final AnimationType? animationType,
    final PinTheme? pinTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        keyboardType: TextInputType.number,
        enableActiveFill: true,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        onChanged: onChanged,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 76,
          fieldWidth: 73,
          selectedColor: LColors.primaryNormal,
          selectedFillColor: LColors.white,
          inactiveColor: LColors.darkGrey,
          activeColor: LColors.lightGrey,
          activeFillColor: LColors.white,
          inactiveFillColor: LColors.lightGrey,
        ),
      ),
    );
  }
}
