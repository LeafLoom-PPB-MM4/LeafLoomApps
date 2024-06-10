import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/authentication/controllers.onboarding/auth_repository.dart';
import '../screens/verify_email.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void registerUser(String email, String password, String role) async {
    try {
      await AuthRepository.instance
          .createUserWithEmailAndPassword(email, password);
      await _firestore
          .collection('users')
          .doc(AuthRepository.instance.auth.currentUser!.uid)
          .set({
        'fullName': fullName.text,
        'email': email,
        'phoneNo': phoneNo.text,
        'role': role,
      });
      Get.offAll(() => VerifyEmailScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to register user: $e');
    }
  }
}
