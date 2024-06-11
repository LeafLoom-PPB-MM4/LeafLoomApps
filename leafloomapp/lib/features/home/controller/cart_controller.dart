import 'package:get/get.dart';
import 'package:leafloom/features/home/model/product_model.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(CartItem item) {
    int index =
        cartItems.indexWhere((element) => element.productId == item.productId);
    if (index != -1) {
      cartItems[index].quantity.value +=
          item.quantityValue; // Mengakses nilai int dari RxInt quantity
    } else {
      cartItems.add(item);
    }
  }

  void removeFromCart(CartItem product) {
    cartItems.remove(product);
  }
}
