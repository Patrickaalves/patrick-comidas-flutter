import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/order_summary_page.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart'; // Importe para usar o Clipboard

class PaymentPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    // Gera os dados de pagamento
    final paymentDetails = _generatePixDetails();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento via Pix'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Texto centralizado
            Text(
              'Escaneie o QR Code abaixo para realizar o pagamento:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // QR Code centralizado
            Center(
              child: SvgPicture.asset(
                'assets/images/qr_code_image.svg', // Caminho da imagem local
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Texto centralizado
            Text(
              'Ou utilize o código abaixo para pagamento via linha digitável:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Código digitável em um campo destacado com roxo claro
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFD1C4E9), // Cor de fundo roxo claro
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple, width: 2),
              ),
              child: SelectableText(
                paymentDetails['lineCode']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Botão de copiar ao lado do código digitável
            ElevatedButton(
              onPressed: () {
                _copyToClipboard(paymentDetails[
                    'lineCode']!); // Copia para a área de transferência
              },
              child: Text('Copiar Código'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            Spacer(),

            // Botão centralizado
            ElevatedButton(
              onPressed: () {
                // Gera os detalhes do pedido dinamicamente
                final orderDetails = _generateOrderDetails();

                // Navegar para a tela de resumo do pedido com os detalhes reais
                Get.to(() => order_summary_page(orderDetails: orderDetails));
              },
              child: Text('Confirmar Pagamento'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Gera os detalhes do Pix com base no carrinho
  Map<String, String> _generatePixDetails() {
    final items = cartController.cartItems;
    final totalPrice = cartController.totalPrice;

    // Exemplo de dados de QR Code e linha digitável
    final qrCodeData = "00020126580014BR.GOV.BCB.PIX0114+55119999999920200"
        "52600010VALOR${totalPrice.toStringAsFixed(2)}5204000053039865405Descricao"
        "5802BR5908Nome Loja6009Cidade62070503***6304ABCD";
    final lineCode = "8368000000${(totalPrice * 100).toStringAsFixed(0)}"
        "013800761320201000202003013";

    return {
      'qrCodeData': qrCodeData,
      'lineCode': lineCode,
    };
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

  /// Função para copiar o texto para a área de transferência
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      // Após copiar, mostre uma mensagem de sucesso
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Código copiado para a área de transferência!')),
      );
    });
  }
}
