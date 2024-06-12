import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/authentication/screens/payment/payment_detail.dart';
import 'package:leafloom/features/home/controller/cart_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: const Text('Keranjang kosong'));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartItems[index];
                  return ListTile(
                    leading: Image.network(product.imageUrl),
                    title: Text(product.name),
                    subtitle: Text('Rp ${product.price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        cartController.removeFromCart(product);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => PaymentDetails());
                },
                child: Text(
                  'Lanjutkan Pemesanan',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 94, 49),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void openwhatsapp(BuildContext context, List cartItems) async {
    var whatsapp = '+6285600131115';
    var message = 'Halo, saya ingin memesan:\n' +
        cartItems.map((item) => '- ${item.name}: Rp ${item.price}').join('\n');
    var whatsappUrlAndroid =
        'whatsapp://send?phone=$whatsapp&text=${Uri.encodeComponent(message)}';
    var whatsappUrlIOS =
        'https://wa.me/$whatsapp?text=${Uri.encodeComponent(message)}';

    if (Platform.isIOS) {
      if (await canLaunch(whatsappUrlIOS)) {
        await launch(whatsappUrlIOS);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tidak dapat membuka WhatsApp'),
          ),
        );
      }
    } else {
      if (await canLaunch(whatsappUrlAndroid)) {
        await launch(whatsappUrlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tidak dapat membuka WhatsApp'),
          ),
        );
      }
    }
  }
}
