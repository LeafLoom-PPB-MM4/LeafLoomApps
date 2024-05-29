import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leafloom/features/authentication/controllers.onboarding/signup_failure.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:leafloom/features/authentication/screens/verify_email.dart';
import 'package:leafloom/navigation_menu.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();

    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => const VerifyEmailScreen());
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  void _setInitialScreen(User? user) {
    if (user != null && user.emailVerified) {
      print("Navigating to NavigationMenu");
      Get.offAll(() => const NavigationMenu());
    } else if (user != null && !user.emailVerified) {
      print("Navigating to VerifyEmailScreen");
      Get.offAll(() => const VerifyEmailScreen());
    } else {
      print("Navigating to LoginScreen");
      Get.offAll(() => const LoginScreen());
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser?.sendEmailVerification();
      print("User created and verification email sent.");
      Get.offAll(() => const VerifyEmailScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupWithFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      throw ex;
    } catch (e) {
      const ex = SignupWithFailure();
      print("EXCEPTION - ${ex.message}");
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _setInitialScreen(_auth.currentUser);
      print("User success login.");
      screenRedirect(); // Tambahkan baris ini untuk mengarahkan ke NavigationMenu
    } on FirebaseAuthException catch (e) {
      print("FIREBASE AUTH EXCEPTION - ${e.message}");
      throw Exception("Login Gagal");
    } catch (e) {
      throw Exception("Login Gagal");
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Logout error: $e");
    }
  }
}