import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/authentication/screens/login/login.dart';
import 'package:leafloom/features/authentication/screens/onboarding/widget/onboarding_page_widget.dart';
import 'package:leafloom/utils/constants/image_strings.dart';
import 'package:leafloom/utils/constants/sizes.dart';
import 'package:leafloom/utils/constants/text_strings.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers.onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: LImages.onBoardingImage1,
                title: LText.onBoardingSubTitle1,
                subtitle: LText.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: LImages.onBoardingImage2,
                title: LText.onBoardingSubTitle3,
                subtitle: LText.onBoardingSubTitle4,
              ),
              OnBoardingPage(
                image: LImages.onBoardingImage3,
                title: LText.onBoardingSubTitle5,
                subtitle: LText.onBoardingSubTitle6,
              )
            ],
          ),

          //Dot Navigation
          Positioned(
              bottom: 100,
              left: LSizes.defaultSpace,
              child: SmoothPageIndicator(
                controller: controller.pageController,
                onDotClicked: controller.dotNavigationClick,
                effect: ExpandingDotsEffect(
                    activeDotColor: LColors.primaryDark,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 4,
                    spacing: 5),
                count: 3,
              )),

          // Skip button
          Positioned(
            left: 25,
            bottom: 25,
            child: OutlinedButton(
                onPressed: () => OnBoardingController.instance.skipPage(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF103B2D)),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Lewati',
                  style: TextStyle(color: Color(0xFF103B2D)),
                )),
          ),

          // Next button
          Positioned(
            right: 25,
            bottom: 25,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                onPressed: () => OnBoardingController.instance.nextPage(),
                // onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => LoginScreen(),
                //     )),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF103B2D),
                ),
                child: const Text(
                  'Berikutnya',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
