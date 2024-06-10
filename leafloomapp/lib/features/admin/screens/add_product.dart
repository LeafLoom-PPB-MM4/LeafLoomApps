import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/admin/controllers/add_product_controller.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Nama Produk',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.categoryController,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Kategori Produk',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.priceController,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Harga Produk',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.urlController,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'URL Produk',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller.descriptionController,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Deskripsi Produk',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                controller.nameController.text,
                controller.categoryController.text,
                controller.priceController.text,
                controller.urlController.text,
                controller.descriptionController.text,
              ),
              child: const Text('Tambah Produk'),
            ),
          ],
        ),
      ),
    );
  }
}
