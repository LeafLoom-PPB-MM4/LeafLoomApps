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
                    width: LHelperFunctions.screenWidth() * 1,
                    height: LHelperFunctions.screenHeight() * 0.6,
                    image: AssetImage(LImages.onBoardingImage1),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: LSizes.spaceBtwItems),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSliderDot(),
                        _buildSliderDot(),
                        _buildSliderDot(),
                      ],
                    ),
                  ),
                  SizedBox(height: LSizes.spaceBtwItems),
                  Text(
                    LText.onBoardingSubTitle1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: const Color(0xFF103B2D)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: LSizes.spaceBtwItems),
                  Text(
                    LText.onBoardingSubTitle2,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),

          // Skip button
          Positioned(
            left: 25,
            bottom: 25,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFF103B2D)),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'Lewati',
                style: TextStyle(color: Color(0xFF103B2D)),
              ),
            ),
          ),

          // Next button
          Positioned(
            right: 25,
            bottom: 25,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFF103B2D),
                ),
                child: Text('Berikutnya'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderDot() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF103B2D),
      ),
    );
  }
}
