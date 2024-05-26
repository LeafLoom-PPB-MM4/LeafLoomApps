import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class GlobalTextFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String? errorText;
  final String? hintText;
  final String prefixIcon;
  final String? suffixIcon;
  final void Function(String)? onChanged;
  final bool showSuffixIcon;
  final bool obscureText;

  GlobalTextFieldWidget({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.errorText,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    required this.showSuffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: LTextTheme.latoMedium14.copyWith(
          color: LColors.grey,
          height: 1.25,
        ),
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            prefixIcon,
            colorFilter: ColorFilter.mode(
                focusNode.hasFocus || controller.text != ''
                    ? LColors.grey
                    : LColors.grey,
                BlendMode.srcIn),
          ),
        ),
        suffixIcon: showSuffixIcon
            ? Padding(
                padding: const EdgeInsets.all(1.0),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    // obscureText ? IconsConstant.show : IconsConstant.hide,
                    IconsConstant.hide,
                    colorFilter: ColorFilter.mode(
                      focusNode.hasFocus || controller.text != ''
                          ? LColors.darkerGrey
                          : LColors.darkerGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: controller.text != '' ? LColors.darkGrey : LColors.darkGrey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: LColors.darkGrey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: LColors.error,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: LColors.error,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
