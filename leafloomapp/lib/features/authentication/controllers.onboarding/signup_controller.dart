import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/authentication/controllers.onboarding/auth_repository.dart';

import '../../../widget/loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void registerUser(String email, String password) {
    AuthRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}
