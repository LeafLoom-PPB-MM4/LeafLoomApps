import 'package:get/get.dart';

class SignupWithFailure {
  final String message;
  const SignupWithFailure(
      [this.message = "Unknown error occurred. Please try again."]);

  factory SignupWithFailure.code(String code) {
    switch (code) {
      case 'weakPassword':
        return const SignupWithFailure('Password is too weak.');
      case 'invalid-email':
        return const SignupWithFailure('Email is invalid.');
      case 'email-already-in-use':
        return const SignupWithFailure('Email is already in use.');
      case 'operation-not-allowed':
        return const SignupWithFailure('Operation is not allowed.');
      case 'user-disable':
        return const SignupWithFailure('User is disabled.');

      default:
        return SignupWithFailure();
    }
  }
}
