import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController urlController;
  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(
    String name,
    String category,
    String price,
    String url,
    String description,
  ) async {
    CollectionReference products = firestore.collection('products');

    try {
      await products.add({
        'url': url,
        'name': name,
        'category': category,
        'price': price,
        'description': description,
      });
      Get.defaultDialog(
        title: 'Success',
        middleText: 'Product added successfully',
        onConfirm: () {
          nameController.clear();
          categoryController.clear();
          priceController.clear();
          urlController.clear();
          descriptionController.clear();
          Get.back();
          Get.back();
        },
        textConfirm: 'OKAY',
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Product addition failed',
      );
    }
  }

  @override
  void onInit() {
    urlController = TextEditingController();
    nameController = TextEditingController();
    categoryController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    urlController.dispose();
    nameController.dispose();
    categoryController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
