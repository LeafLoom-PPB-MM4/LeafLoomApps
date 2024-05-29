import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/widget/image_loader.dart';

import '../constants/colors.dart';

class ScreenLoader {
  static void openLoadingDialog(String text, String image) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
                child: Container(
              color: LColors.grey,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 280,
                  ),
                  ImageLoader(text: text, image: image)
                ],
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
