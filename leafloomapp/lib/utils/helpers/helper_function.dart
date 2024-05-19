import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LHelperFunctions {
  static void showSnackBar(String message) {
    final context = Get.context;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  static void showAlert(String title, String message) {
    final context = Get.context;
    if (context != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  static screenWidth() {}

  static screenHeight() {}

  // Implementasi lainnya juga harus memeriksa konteks sebelum mengaksesnya
}
