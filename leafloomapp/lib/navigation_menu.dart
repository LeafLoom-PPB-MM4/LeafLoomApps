import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: Colors.white, // Atur warna latar belakang di sini
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

  final List<Widget> screens = [
    Container(color: Colors.green),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
  ];
}
