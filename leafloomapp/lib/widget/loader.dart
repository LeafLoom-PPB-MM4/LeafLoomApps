import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/utils/constants/text_strings.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

import '../utils/constants/colors.dart';

class Loaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: LColors.lightGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              message,
              style: LTextTheme.latoMedium14,
            ),
          ),
        )));
  }

  static succesSnackBar({required title, message = "", duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: LColors.textDark,
        backgroundColor: LColors.succes,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: Icon(
          Icons.check_circle,
          color: LColors.white,
        ));
  }

  static warningSnackBar({required title, message = "", duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: LColors.textDark,
        backgroundColor: LColors.warning,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: Icon(
          Icons.warning,
          color: LColors.white,
        ));
  }

  static errorSnackBar({required title, message = "", duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: LColors.textDark,
        backgroundColor: LColors.error,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: Icon(
          Icons.error,
          color: LColors.textDark,
        ));
  }
}
