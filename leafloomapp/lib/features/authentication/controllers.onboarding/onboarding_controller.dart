import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //update current index when page scroll
  void updatePageIndicator(index) {}

  //jumpt to the specific dot selected page
  void dotNavigationClick(index) {}

  //update Current Index & jump to the last page
  void skipPage() {}
}
