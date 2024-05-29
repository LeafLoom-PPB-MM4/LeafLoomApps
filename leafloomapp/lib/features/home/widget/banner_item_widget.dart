import 'package:flutter/material.dart';

class BannerItemWidget extends StatelessWidget {
  const BannerItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 163,
      width: 324,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Image.asset(
            'assets/images/banner/Banner2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Image.asset(
            'assets/images/banner/Banner2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Image.asset(
            'assets/images/banner/Banner2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
