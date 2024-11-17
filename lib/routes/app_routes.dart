import 'package:get/get.dart';
import '../views/menu_page.dart';
import '../views/cart_page.dart'; 
import '../views/address_page.dart';
import '../views/payment_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => MenuPage()),
    GetPage(name: '/cart', page: () => CartPage()),
    GetPage(name: '/address', page: () => address_page()),
    GetPage(name: '/payment', page: () => payment_page()),
  ];
}
