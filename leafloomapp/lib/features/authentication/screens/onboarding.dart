import 'package:flutter/material.dart';
import 'package:leafloom/utils/constants/image_strings.dart';
import 'package:leafloom/utils/constants/sizes.dart';
import 'package:leafloom/utils/constants/text_strings.dart';
import 'package:leafloom/utils/helpers/helper_function.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Horizontal Scrollable Pages
          PageView(
            children: [
              Column(
                children: [
                  Image(
                    width: LHelperFunctions.screenWidth() * 0.8,
                    height: LHelperFunctions.screenHeight() * 0.6,
                    image: AssetImage(LImages.onBoardingImage1),
                  ),
                  Text(
                    LText.onBoardingSubTitle1,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: LSizes.spaceBtwItems),
                  Text(
                    LText
                        .onBoardingSubTitle2, // corrected from onBoardingSubTitle1
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),

          //skip button

          //Dot Navigation SmoothPageIndicator

          //circular button
        ],
      ),
    );
  }
}
