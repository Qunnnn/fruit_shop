import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  final String name;
  final String price;
  final Color color;
  final bool isSelected;
  final String image;
  final List<List<String>> nutrients;

  Product(

      {
      required this.color,
      required this.image,
      required this.isSelected,
      required this.name,
      required this.nutrients,
      required this.price,
     });
}

class Category {
  final String name;
  final List<Product>? products;
  final double textLength;
  Category({required this.name, this.products, required this.textLength});
}

final data = [
  Category(
      name: 'Fruits',
      products: [
        Product(
            color: Colors.red.shade50,
            image: 'assets/fruits/apple.png',
            isSelected: false,
            name: 'Apple Fruit',
            nutrients: [
              ['Energy', '3'],
              ['Freshness', '2'],
              ['Vitamin', '4'],
              ['Calories', '1'],
            ],
            price: '5.60'),
        Product(
            color: Colors.yellow.shade50,
            image: 'assets/fruits/lemon.png',
            isSelected: false,
            name: 'Lemon Fruit',
            nutrients: [
              ['Energy', '4'],
              ['Freshness', ' 2'],
              ['Vitamin', ' 2'],
              ['Calories', '1'],
            ],
            price: '3.10'),
        Product(
            color: Colors.lightGreen.shade50,
            image: 'assets/fruits/avocado.png',
            isSelected: false,
            name: 'Avocado Fruit',
            nutrients: [
              ['Energy', ' 3'],
              ['Freshness', '2'],
              ['Vitamin', '2'],
              ['Calories', '3'],
            ],
            price: '8.99'),
        Product(
            color: Colors.purple.shade50,
            image: 'assets/fruits/grapes.png',
            isSelected: false,
            name: 'Grape Fruit',
            nutrients: [
              ['Energy', '4'],
              ['Freshness' '3'],
              ['Vitamin', ' 1'],
              ['Calories', '2'],
            ],
            price: '6.20'),
      ],
      textLength: 50),
  Category(name: "Vegetables", textLength: 80),
  Category(name: "Diary", textLength: 50),
  Category(name: "Grains", textLength: 50),
  Category(name: "Meats", textLength: 50),
];

final nutrientsColor = [
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.yellow,
];

class Card extends ChangeNotifier {
  List<Product> userCard = [];

  List<Product> getUserCard() => userCard;

  void addItemToCard(Product product) {
    userCard.add(product);
    notifyListeners();
  }

  void deleteItem(Product product) {
    userCard.remove(product);
    notifyListeners();
  }
}
