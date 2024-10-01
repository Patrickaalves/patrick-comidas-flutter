import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/food_controller.dart';
import 'food_card.dart';
import '../controllers/cart_controller.dart'; // Certifique-se de importar o controlador do carrinho

class MenuPage extends StatelessWidget {
  final FoodController foodController = Get.put(FoodController());
  final CartController cartController = Get.put(CartController()); // Controlador do carrinho

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrick Comidas - Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart'); // Navega para a página do carrinho
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Barra de pesquisa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                foodController.searchFood(query); // Chama o método de pesquisa
              },
            ),
          ),
          // Lista de categorias
          _buildCategoryList(),
          // Lista de itens de comida
          Expanded(child: _buildFoodList()),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    List<String> categories = ['All', 'Pizza', 'Burger', 'Sushi', 'Drinks'];

    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return GestureDetector(
              onTap: () {
                foodController.setCategory(categories[index]);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: foodController.selectedCategory.value == categories[index]
                      ? Colors.orange
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text(categories[index])),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildFoodList() {
    return Obx(() {
      if (foodController.filteredFoodItems.isEmpty) {
        return Center(child: Text('Nenhum item encontrado.'));
      }

      return ListView.builder(
        itemCount: foodController.filteredFoodItems.length,
        itemBuilder: (context, index) {
          return FoodCard(foodItem: foodController.filteredFoodItems[index]);
        },
      );
    });
  }

}
