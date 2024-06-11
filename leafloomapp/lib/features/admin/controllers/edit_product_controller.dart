import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController editUrl;
  late TextEditingController editName;
  late TextEditingController editCategory;
  late TextEditingController editPrice;
  late TextEditingController editDescription;
  var selectedCategory = ''.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    return await docRef.get() as DocumentSnapshot<Map<String, dynamic>>;
  }

  void editProduct(
    String name,
    String category,
    String price,
    String url,
    String description,
    String docID,
  ) async {
    DocumentReference docData = firestore.collection('products').doc(docID);

    try {
      await docData.update({
        'url': url,
        'name': name,
        'category': category,
        'price': price,
        'description': description,
      });
      Get.defaultDialog(
        title: 'Success',
        middleText: 'Product Edited successfully',
        onConfirm: () {
          editName.clear();
          editCategory.clear();
          editCategory.clear();
          editUrl.clear();
          editDescription.clear();
          Get.back();
          Get.back();
        },
        textConfirm: 'OKAY',
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Failed Edit Product',
      );
    }
  }

  @override
  void onInit() {
    editUrl = TextEditingController();
    editName = TextEditingController();
    editCategory = TextEditingController();
    editPrice = TextEditingController();
    editDescription = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    editUrl.dispose();
    editName.dispose();
    editCategory.dispose();
    editPrice.dispose();
    editDescription.dispose();
    super.onClose();
  }
}
