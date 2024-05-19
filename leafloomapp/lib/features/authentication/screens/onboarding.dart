import 'package:flutter/material.dart';
import 'package:leafloom/utils/constants/image_strings.dart';
import 'package:leafloom/utils/constants/sizes.dart';
import 'package:leafloom/utils/constants/text_strings.dart';
import 'package:leafloom/utils/helpers/helper_function.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildOnBoardingPage(
                LImages.onBoardingImage1,
                LText.onBoardingSubTitle1,
                LText.onBoardingSubTitle2,
              ),
              _buildOnBoardingPage(
                LImages.onBoardingImage2,
                LText.onBoardingSubTitle3,
                LText.onBoardingSubTitle4,
              ),
              _buildOnBoardingPage(
                LImages.onBoardingImage3,
                LText.onBoardingSubTitle5,
                LText.onBoardingSubTitle6,
              ),
            ],
          ),

          // Skip button
          Positioned(
            left: 25,
            bottom: 25,
            child: OutlinedButton(
              onPressed: () {
                _pageController.jumpToPage(2);
              },
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
                onPressed: () {
                  if (_currentPage < 2) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // Navigate to the next screen
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFF103B2D),
                ),
                child: Text('Berikutnya'),
              ),
            ),
          ),

          // Slider dots
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSliderDot(0),
                _buildSliderDot(1),
                _buildSliderDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnBoardingPage(
      String image, String subTitle1, String subTitle2) {
    return Column(
      children: [
        Image(
          width: LHelperFunctions.screenWidth() * 1,
          height: LHelperFunctions.screenHeight() * 0.6,
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        SizedBox(height: LSizes.spaceBtwItems),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSliderDot(0),
              _buildSliderDot(1),
              _buildSliderDot(2),
            ],
          ),
        ),
        SizedBox(height: LSizes.spaceBtwItems),
        Text(
          subTitle1,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: const Color(0xFF103B2D), fontSize: 24),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: LSizes.spaceBtwItems),
        Text(
          subTitle2,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSliderDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Color(0xFF103B2D) : Colors.grey,
      ),
    );
  }
}
