import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/home/screen/home_screen.dart';
import 'package:leafloom/features/produk/product_screen.dart';
import 'package:leafloom/features/profile/profile.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => Stack(
          children: [
            NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) {
                controller.selectedIndex.value = index;
              },
              backgroundColor: Colors.white,
              destinations: [
                NavigationDestination(
                  icon: _buildIcon(
                    controller.selectedIndex.value == 0
                        ? IconsConstant.homeFill
                        : IconsConstant.home,
                  ),
                  label: 'Beranda',
                ),
                NavigationDestination(
                  icon: _buildIcon(
                    controller.selectedIndex.value == 1
                        ? IconsConstant.produkFill
                        : IconsConstant.produk,
                  ),
                  label: 'Produk',
                ),
                NavigationDestination(
                  icon: _buildIcon(
                    controller.selectedIndex.value == 2
                        ? IconsConstant.profileFill
                        : IconsConstant.profile,
                  ),
                  label: 'Profil',
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: _getIndicatorPosition(controller.selectedIndex.value,
                  MediaQuery.of(context).size.width),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 4,
                color: LColors.primaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getIndicatorPosition(int index, double screenWidth) {
    return (screenWidth / 3) * index;
  }

  Widget _buildIcon(String assetName) {
    return SvgPicture.asset(
      assetName,
      width: 24,
      height: 24,
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    ProductScreen(),
    ProfileScreen(),
  ];
}
