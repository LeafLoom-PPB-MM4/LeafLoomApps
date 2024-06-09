import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/authentication/controllers.onboarding/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void loginUser(String email, String password) async {
    try {
      await AuthRepository.instance.loginWithEmailAndPassword(email, password);
    } catch (e) {
      Get.snackbar('Error', 'Login gagal. Silakan coba lagi.');
    }
  }

  Future<void> googleSignIn() async {
    try {
      final userCredential = AuthRepository.instance.signInWithGoogle();
    } catch (e) {
      Get.snackbar('Error', 'Login gagal. Silakan coba lagi.');
    }
  }
}
