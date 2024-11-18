import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/food_item.dart';

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;
  final CartController cartController =
      Get.put(CartController()); // Instancia o controlador do carrinho

  FoodCard({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    IconData getFoodIcon(String category) {
      switch (category) {
        case 'Pizza':
          return Icons.local_pizza; // Ícone de pizza
        case 'Burger':
          return Icons.fastfood; // Ícone de hambúrguer
        case 'Sushi':
          return Icons.restaurant; // Ícone de restaurante (genérico)
        case 'Drinks':
          return Icons.local_drink; // Ícone de bebida
        default:
          return Icons.food_bank; // Ícone genérico de comida
      }
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Icon(
          getFoodIcon(foodItem.category), // Exibe o ícone baseado na categoria
          size: 50,
          color: Colors.orange, // Cor do ícone
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
