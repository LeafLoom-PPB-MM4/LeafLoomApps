import 'package:flutter/material.dart';

class ListBannerWidget extends StatelessWidget {
  final List<String> bannerPaths;

  const ListBannerWidget({Key? key, required this.bannerPaths})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: bannerPaths.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            bannerPaths[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        );
      },
    );
  }
}
