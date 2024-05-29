import 'package:flutter/material.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class GlobalButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const GlobalButtonWidget(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: LColors.primaryNormal,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: LTextTheme.latoBold16.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
