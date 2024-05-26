import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/new_pass_screen.dart';
import 'package:leafloom/features/authentication/widget/global_button_widget.dart';
import 'package:leafloom/features/authentication/widget/global_text_field_widget.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class ConfirmPassScreen extends StatefulWidget {
  const ConfirmPassScreen({super.key});

  @override
  State<ConfirmPassScreen> createState() => _ConfirmPassScreenState();
}

class _ConfirmPassScreenState extends State<ConfirmPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _validatePasswords() {
    setState(() {
      if (_passwordController.text.isEmpty) {
        _passwordErrorText = 'Kata sandi tidak boleh kosong';
      } else {
        _passwordErrorText = null;
      }

      if (_confirmPasswordController.text.isEmpty) {
        _confirmPasswordErrorText = 'Konfirmasi kata sandi tidak boleh kosong';
      } else if (_confirmPasswordController.text != _passwordController.text) {
        _confirmPasswordErrorText = 'Kata sandi tidak cocok';
      } else {
        _confirmPasswordErrorText = null;
      }
    });
  }

  void _showConfirmationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: LColors.primaryLight,
          title: Text(
            'Hampir Selesai!',
            style: LTextTheme.latoBold14.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Tinggal selangkah lagi untuk menyelesaikan. Meninggalkan halaman ini akan menghapus semua perubahan yang belum disimpan.',
            style: LTextTheme.latoReguler12.copyWith(
              color: LColors.textNormal,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Keluar',
                    style: LTextTheme.latoReguler14.copyWith(
                      color: LColors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Tetap di sini',
                      style: LTextTheme.latoReguler14.copyWith(
                        color: LColors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: LColors.primaryNormal,
                    )),
              ],
            ),
          ],
        );
      },
    );
  }

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
                color: LColors.black,
              ),
              iconSize: 24,
              onPressed: () => _showConfirmationPopup(),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: 16, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    child: Text(
                      'Kata Sandi Baru',
                      style: LTextTheme.latoSemiBold16.copyWith(
                        fontWeight: FontWeight.w700,
                        color: LColors.textDarker,
                      ),
                    ),
                  ),
                  GlobalTextFieldWidget(
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                    errorText: _passwordErrorText,
                    hintText: 'Masukkan Kata Sandi Anda',
                    prefixIcon: IconsConstant.lock,
                    showSuffixIcon: true,
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    height: 20,
                    child: Text(
                      'Konfirmasi Kata Sandi',
                      style: LTextTheme.latoSemiBold16.copyWith(
                        fontWeight: FontWeight.w700,
                        color: LColors.textDarker,
                      ),
                    ),
                  ),
                  GlobalTextFieldWidget(
                    focusNode: _confirmPasswordFocusNode,
                    controller: _confirmPasswordController,
                    errorText: _confirmPasswordErrorText,
                    hintText: 'Konfirmasi Kata Sandi Anda',
                    prefixIcon: IconsConstant.lock,
                    showSuffixIcon: true,
                  ),
                  const SizedBox(height: 36),
                  GlobalButtonWidget(
                    text: 'Simpan',
                    onTap: () {
                      _validatePasswords();
                      if (_formKey.currentState!.validate() &&
                          _passwordErrorText == null &&
                          _confirmPasswordErrorText == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewPasswordScreen(),
                          ),
                        );
                      }
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
