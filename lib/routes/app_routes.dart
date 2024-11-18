import 'package:get/get.dart';
import '../views/menu_page.dart';
import '../views/cart_page.dart';
import '../views/address_page.dart';
import '../views/payment_page.dart';
import '../views/order_summary_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => menu_page()),
    GetPage(name: '/cart', page: () => cart_page()),
    GetPage(name: '/address', page: () => address_page()),
    GetPage(name: '/payment', page: () => payment_page()),
    GetPage(
        name: '/order_summary',
        page: () => order_summary_page(
            orderDetails: 'Resumo do pedido')),
  ];
}
