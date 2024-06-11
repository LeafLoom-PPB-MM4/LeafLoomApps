import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:leafloom/features/authentication/controllers.onboarding/auth_repository.dart';
import 'package:leafloom/features/authentication/screens/forgot_password/forgot_password_screen.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:leafloom/features/authentication/screens/signup/signup.dart';
import 'package:leafloom/features/authentication/screens/verify_email.dart';
import 'package:leafloom/features/home/controller/cart_controller.dart';
import 'package:leafloom/features/home/screen/cart.dart';
import 'package:leafloom/features/produk/detail_produk.dart';
import 'package:leafloom/firebase_options.dart';
import 'package:leafloom/navigation_menu.dart';
import 'package:leafloom/features/admin/screens/admin_home_screen.dart';
import 'package:leafloom/features/admin/screens/admin_product_screen.dart';
import 'package:leafloom/features/admin/screens/admin_order_screen.dart';
import 'package:leafloom/features/admin/screens/admin_edit_screen.dart';
import 'package:leafloom/utils/constants/colors.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthRepository()));

  // Initialize the CartController
  Get.put(CartController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leafloom',
      theme: ThemeData(
        primaryColor: LColors.primaryNormal,
      ),
      initialRoute: '/onboarding',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/onboarding', page: () => OnBoardingScreen()),
        GetPage(name: '/verify-email', page: () => VerifyEmailScreen()),
        GetPage(name: '/navigation-menu', page: () => NavigationMenu()),
        GetPage(name: '/admin-home', page: () => AdminHomeScreen()),
        GetPage(name: '/admin-product', page: () => AdminProductScreen()),
        GetPage(name: '/admin-edit', page: () => AdminEditScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
        GetPage(
            name: '/product-detail',
            page: () => ProductDetailScreen(productId: '')),
      ],
    );
  }
}
