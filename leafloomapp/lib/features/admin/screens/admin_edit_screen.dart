import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/admin/controllers/edit_product_controller.dart';

class AdminEditScreen extends StatelessWidget {
  final EditProductController controller = Get.put(EditProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Produk'),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.editName.text = data['name'];
            controller.editCategory.text = data['category'];
            controller.editPrice.text = data['price'];
            controller.editUrl.text = data['url'];
            controller.editDescription.text = data['description'];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller.editName,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Nama Produk',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: controller.editCategory,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Kategori Produk',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: controller.editPrice,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Harga Produk',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: controller.editUrl,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'URL Produk',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: controller.editDescription,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Deskripsi Produk',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => controller.editProduct(
                      controller.editName.text,
                      controller.editCategory.text,
                      controller.editPrice.text,
                      controller.editUrl.text,
                      controller.editDescription.text,
                      Get.arguments,
                    ),
                    child: const Text('Edit Produk'),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
