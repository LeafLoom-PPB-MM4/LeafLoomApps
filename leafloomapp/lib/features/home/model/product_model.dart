import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartItem {
  final String productId;
  final String name;
  final double price;
  final RxInt
      quantity; // Menggunakan RxInt untuk mengelola perubahan pada quantity
  final String imageUrl;

  CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required int quantity, // Mengubah tipe quantity menjadi int
    required this.imageUrl,
  }) : this.quantity =
            quantity.obs; // Menginisialisasi RxInt quantity dengan nilai awal

  // Getter untuk mendapatkan nilai int dari RxInt quantity
  int get quantityValue => quantity.value;
}
