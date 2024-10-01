import 'package:get/get.dart';
import '../models/food_item.dart';

class FoodController extends GetxController {
  var foodItems = <FoodItem>[].obs; // Lista observável de itens de comida
  var selectedCategory = 'All'.obs; // Categoria selecionada
  var filteredFoodItems = <FoodItem>[].obs; // Itens filtrados pela pesquisa

  @override
  void onInit() {
    super.onInit();
    loadFoodItems(); // Carregar os itens de comida ao iniciar o controlador
  }

  void loadFoodItems() {
    // Simulação de carregamento de itens de comida
    foodItems.addAll([
      FoodItem(id: '1', name: 'Pizza', category: 'Pizza', price: 9.99, imageUrl: 'https://...', description: 'description'),
      FoodItem(id: '2', name: 'Burger', category: 'Burger', price: 5.99, imageUrl: 'https://...', description: 'description'),
      FoodItem(id: '3', name: 'Sushi', category: 'Sushi', price: 12.99, imageUrl: 'https://...', description: 'description'),
      // Adicione mais itens conforme necessário
    ]);
    filteredFoodItems.assignAll(foodItems); // Inicialmente, todos os itens são exibidos
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    filterFoodItems(); // Filtra itens pela categoria
  }

  // Método para realizar a busca com base no termo (query)
  void searchFood(String query) {
    if (query.isEmpty) {
      // Se a pesquisa estiver vazia, mostrar todos os itens
      filteredFoodItems.assignAll(foodItems);
    } else {
      // Filtrar os itens com base na pesquisa
      filteredFoodItems.assignAll(
        foodItems.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }

  // Método para filtrar itens com base na categoria selecionada
  void filterFoodItems() {
    if (selectedCategory.value == 'All') {
      filteredFoodItems.assignAll(foodItems);
    } else {
      filteredFoodItems.assignAll(
        foodItems.where((item) => item.category == selectedCategory.value).toList(),
      );
    }
  }
}
