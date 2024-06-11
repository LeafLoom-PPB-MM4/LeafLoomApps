import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/admin/controllers/edit_product_controller.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class AdminEditScreen extends StatelessWidget {
  final EditProductController controller = Get.put(EditProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Produk',
            style: TextStyle(color: LColors.textDarker)),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.editName.text = data['name'];
            controller.selectedCategory.value = data['category'];
            controller.editPrice.text = data['price'];
            controller.editUrl.text = data['url'];
            controller.editDescription.text = data['description'];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildTextField(
                    controller: controller.editName,
                    labelText: 'Nama Produk',
                  ),
                  SizedBox(height: 16),
                  _buildDropdownButtonFormField(controller),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: controller.editPrice,
                    labelText: 'Harga Produk',
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: controller.editUrl,
                    labelText: 'URL Produk',
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: controller.editDescription,
                    labelText: 'Deskripsi Produk',
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => controller.editProduct(
                      controller.editName.text,
                      controller.selectedCategory.value,
                      controller.editPrice.text,
                      controller.editUrl.text,
                      controller.editDescription.text,
                      Get.arguments,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LColors.primaryNormal,
                    ),
                    child: const Text(
                      'Edit Produk',
                      style: TextStyle(color: LColors.white),
                    ),
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
        labelStyle: TextStyle(color: LColors.textDarker),
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

  Widget _buildDropdownButtonFormField(EditProductController controller) {
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
              style: TextStyle(color: LColors.textDarker),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: 'Kategori Produk',
          labelStyle: TextStyle(color: LColors.textDarker),
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
