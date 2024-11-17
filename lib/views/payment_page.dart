import 'package:flutter/material.dart';
import 'package:get/get.dart';

class payment_page extends StatelessWidget {
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
                // Exibir mensagem de sucesso
                Get.snackbar(
                  'Pedido Confirmado',
                  'Seu pedido foi realizado com sucesso!',
                  snackPosition: SnackPosition.BOTTOM,
                );
                // Voltar para a tela inicial ou carrinho
                Get.offAllNamed(
                    '/home'); // Substitua '/home' pela rota desejada
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
}
