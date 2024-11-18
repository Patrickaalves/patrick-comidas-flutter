import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/order_summary_page.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class payment_page extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações de Pagamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Número do Cartão',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Validade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Código de Segurança',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Gera os detalhes do pedido dinamicamente
                final orderDetails = _generateOrderDetails();

                // Navegar para a tela de resumo do pedido com os detalhes reais
                Get.to(() => order_summary_page(orderDetails: orderDetails));
              },
              child: Text('Confirmar'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Gera os detalhes do pedido com base nos itens do carrinho
  String _generateOrderDetails() {
    final items = cartController.cartItems;
    final totalPrice = cartController.totalPrice;

    String details = 'Pedido Confirmado!\n';
    for (var item in items) {
      details += '- ${item.name}: R\$${item.price.toStringAsFixed(2)}\n';
    }
    details += 'Total: R\$${totalPrice.toStringAsFixed(2)}\n';
    details += 'Obrigado por comprar conosco!';
    return details;
  }
}
