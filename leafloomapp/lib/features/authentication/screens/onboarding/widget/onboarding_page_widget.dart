import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/sizes.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          width: double.infinity,
          height: 500,
          image: AssetImage(widget.image),
          fit: BoxFit.cover,
        ),
        const SizedBox(height: LSizes.spaceBtwItems),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: LTextTheme.latoBold24.copyWith(
              color: LColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: LSizes.spaceBtwItems,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.subtitle,
            style: LTextTheme.latoMedium16.copyWith(
              color: LColors.textNormal,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
