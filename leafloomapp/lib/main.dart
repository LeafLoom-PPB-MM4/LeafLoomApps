import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leafloom/features/authentication/controllers.onboarding/auth_repository.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/forgot_password_screen.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:leafloom/features/authentication/screens/signup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:leafloom/features/authentication/screens/verify_email.dart';
import 'package:leafloom/firebase_options.dart';
import 'package:leafloom/navigation_menu.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then((value) => Get.put(AuthRepository()));
//   runApp(const MyApp());
// }

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Leafloom',
      initialRoute: '/onboarding',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/onboarding', page: () => OnBoardingScreen()),
        GetPage(name: '/verify-email', page: () => VerifyEmailScreen()),
        GetPage(name: '/navigation-menu', page: () => NavigationMenu()),
      ],
    );
  }
}
