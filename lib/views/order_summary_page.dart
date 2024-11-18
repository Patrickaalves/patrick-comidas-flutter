import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class order_summary_page extends StatelessWidget {
  final String orderDetails; // Resumo do pedido

  order_summary_page({required this.orderDetails});

  // Número fixo para enviar no WhatsApp
  final String fixedPhoneNumber = "5547999207282"; // Número fixo

  // Método para abrir o WhatsApp
  void _openWhatsApp(String message) async {
    final whatsappUrl =
        "https://wa.me/$fixedPhoneNumber?text=${Uri.encodeComponent(message)}";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print("WhatsApp não encontrado.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumo do Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumo do Pedido',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(orderDetails, style: TextStyle(fontSize: 16)),
            Spacer(),
            // Botão de Compartilhar no WhatsApp centralizado e maior
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _openWhatsApp(orderDetails);
                },
                icon: Icon(Icons.share, size: 30), // Ícone maior
                label: Text(
                  'Compartilhar no WhatsApp',
                  style: TextStyle(fontSize: 18), // Texto maior
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20), // Aumentando o botão
                  minimumSize: Size(250, 60), // Tamanho mínimo do botão
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
