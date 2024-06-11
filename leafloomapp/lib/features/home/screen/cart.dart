import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/home/controller/cart_controller.dart';
import 'package:open_whatsapp/open_whatsapp.dart';

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
                  String message = "Halo, saya ingin memesan:\n";
                  cartController.cartItems.forEach((product) {
                    message += "- ${product.name}\n";
                  });
                  message += "Terima kasih.";

                  FlutterOpenWhatsapp.sendSingleMessage(
                      "6281234047471", message);
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
}
