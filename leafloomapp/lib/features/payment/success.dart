import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/produk/product_screen.dart';
import 'package:leafloom/navigation_menu.dart';
import 'package:leafloom/utils/constants/image_strings.dart';

import '../../utils/constants/colors.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                LImages.success,
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Successful !!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Congratulations! Pesanan berhasil dikonfirmasi. Terima kasih telah berbelanja di Leafloom.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => NavigationMenu());
                  },
                  child: const Text(
                    'Kembali',
                    style: TextStyle(color: LColors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LColors.primaryNormal,
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
