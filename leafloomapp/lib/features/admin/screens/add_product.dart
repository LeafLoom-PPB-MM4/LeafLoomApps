import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/admin/controllers/add_product_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/theme/custon_themes/text_theme.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk',
          style: TextStyle(color: LColors.textDarker),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(
              controller: controller.nameController,
              labelText: 'Nama Produk',
            ),
            SizedBox(height: 16),
            _buildDropdownButtonFormField(controller),
            SizedBox(height: 16),
            _buildTextField(
              controller: controller.priceController,
              labelText: 'Harga Produk',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: controller.urlController,
              labelText: 'URL Produk',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: controller.descriptionController,
              labelText: 'Deskripsi Produk',
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                controller.nameController.text,
                controller.selectedCategory.value,
                controller.priceController.text,
                controller.urlController.text,
                controller.descriptionController.text,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: LColors.primaryNormal,
              ),
              child: const Text(
                'Tambah Produk',
                style: TextStyle(color: LColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextField(
      controller: controller,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            TextStyle(color: LColors.textDarker), // Ubah warna teks label
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: LColors.primaryNormal),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: LColors.primaryNormal),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: LColors.primaryNormal),
        ),
      ),
    );
  }

  Widget _buildDropdownButtonFormField(AddProductController controller) {
    return Obx(
      () => DropdownButtonFormField<String>(
        value: controller.selectedCategory.value,
        onChanged: (newValue) {
          controller.selectedCategory.value = newValue!;
        },
        items: <String>['Pakaian', 'Tas', 'Sepatu', 'Lainnya']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: LColors.textDarker, // Ubah warna teks label
              ),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: 'Kategori Produk',
          labelStyle:
              TextStyle(color: LColors.textDarker), // Ubah warna teks label
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: LColors.primaryNormal),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: LColors.primaryNormal),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: LColors.primaryNormal),
          ),
        ),
      ),
    );
  }
}
