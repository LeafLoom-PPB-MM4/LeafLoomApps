import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:leafloom/widget/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {}
    } catch (e) {
      Loaders.warningSnackBar(
          title: "Data Not Save", message: "Something wrong");
    }
  }
}
