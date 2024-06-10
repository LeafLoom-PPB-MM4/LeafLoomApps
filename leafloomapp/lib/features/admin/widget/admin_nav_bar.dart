import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/admin/screens/admin_edit_screen.dart';
import 'package:leafloom/features/admin/screens/admin_home_screen.dart';
import 'package:leafloom/features/admin/screens/admin_product_screen.dart';
import 'package:leafloom/features/home/screen/home_screen.dart';
import 'package:leafloom/features/produk/product_screen.dart';
import 'package:leafloom/features/profile/profile.dart';
import 'package:leafloom/utils/constants/colors.dart';

import '../screens/admin_order_screen.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.selectedIndex.value = index;
          },
          backgroundColor: Colors.white,
          selectedItemColor: LColors.primaryDark,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag),
              label: 'Produk',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              activeIcon: Icon(Icons.list_alt),
              label: 'Pesanan',
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    AdminHomeScreen(),
    AdminProductScreen(),
    AdminOrderScreen(),
  ];
}
