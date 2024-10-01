import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/food_item.dart';

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;
  final CartController cartController = Get.put(CartController()); // Instancia o controlador do carrinho

  FoodCard({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Image.network(
          foodItem.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover, // Ajusta a imagem ao espaço disponível
        ),
        title: Text(foodItem.name),
        subtitle: Text(foodItem.description),
        trailing: Column(
          mainAxisSize: MainAxisSize.min, // Usar apenas o espaço necessário
          children: [
            Text('\$${foodItem.price}'),
            SizedBox(height: 4), // Espaçamento entre o texto e o ícone
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartController.addItem(foodItem); // Adiciona o item ao carrinho
                Get.snackbar(
                  'Adicionado ao carrinho',
                  '${foodItem.name} foi adicionado ao carrinho.',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
