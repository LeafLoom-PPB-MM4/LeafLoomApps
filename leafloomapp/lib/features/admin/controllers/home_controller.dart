import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamData() {
    CollectionReference<Map<String, dynamic>> products =
        firestore.collection("products");
    return products.orderBy('category').snapshots();
  }

  void deleteProduct(String docID) {
    DocumentReference docRef = firestore.collection('products').doc(docID);
    try {
      Get.defaultDialog(
        title: 'Delete Data',
        middleText: 'Apakah Yakin akan menghapus Produk?',
        onConfirm: () async {
          await docRef.delete();
          Get.back();
        },
        textConfirm: 'Hapus',
        textCancel: 'Batal',
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Gagal Menghapus Produk',
      );
    }
  }
}
