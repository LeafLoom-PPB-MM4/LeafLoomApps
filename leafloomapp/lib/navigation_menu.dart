import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/shop/screens/home/home.dart';
import 'package:leafloom/features/shop/screens/profile/profile.dart';
import 'package:leafloom/features/shop/screens/shop/produk.dart';

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
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            // Navigasi sesuai dengan indeks tombol yang ditekan
            controller.selectedIndex.value = index;
          },
          backgroundColor: Colors.white,
          destinations: const [
            NavigationDestination(
              icon: ImageIcon(AssetImage('assets/icons/beranda.png')),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: ImageIcon(AssetImage('assets/icons/produk.png')),
              label: 'Produk',
            ),
            NavigationDestination(
              icon: ImageIcon(AssetImage('assets/icons/profile.png')),
              label: 'Profil',
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
    const HomeScreen(),
    ProdukScreen(),
    ProfileScreen(),
  ];
}
