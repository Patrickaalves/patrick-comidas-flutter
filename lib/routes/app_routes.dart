import 'package:get/get.dart';
import '../views/menu_page.dart';
import '../views/cart_page.dart'; // Exemplo de outra página

class AppRoutes {
  static final routes = [
    // Rota para a página principal (Menu)
    GetPage(name: '/', page: () => MenuPage()),

    // Exemplo de rota para a página do carrinho de compras
    GetPage(name: '/cart', page: () => CartPage()),
  ];
}
