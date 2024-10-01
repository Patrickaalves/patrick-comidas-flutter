import 'package:get/get.dart';
import '../models/food_item.dart';

class CartController extends GetxController {
  var cartItems = <FoodItem>[].obs;
  var totalPrice = 0.0.obs;

  void addItem(FoodItem item) {
    cartItems.add(item);
    calculateTotalPrice();
  }

  void removeItem(FoodItem item) {
    cartItems.remove(item);
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice.value = cartItems.fold(0, (sum, item) => sum + item.price);
  }

  // Limpar o carrinho
  void clearCart() {
    cartItems.clear();
    totalPrice.value = 0.0;
  }
}
