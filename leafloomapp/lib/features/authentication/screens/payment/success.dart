import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leafloom/utils/constants/image_strings.dart';

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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
