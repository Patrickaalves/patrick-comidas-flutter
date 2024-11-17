import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/address_page.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Limpar o carrinho
              cartController.clearCart();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text('Seu carrinho está vazio.'));
        } else {
          return Column(
            children: [
              // Lista de itens do carrinho
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    var cartItem = cartController.cartItems[index];
                    return ListTile(
                      leading: Image.network(cartItem.imageUrl,
                          width: 50, height: 50),
                      title: Text(cartItem.name),
                      subtitle: Text('\$${cartItem.price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          cartController.removeItem(cartItem);
                        },
                      ),
                    );
                  },
                ),
              ),
              // Total do pedido
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Obx(() => Text('\$${cartController.totalPrice}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
              // Botão de finalizar pedido
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar para a tela de endereço
                    Get.to(() => address_page());
                  },
                  child: Text('Finalizar Pedido'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
