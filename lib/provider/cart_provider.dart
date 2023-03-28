import 'package:flutter/cupertino.dart';
import '../../../data/data.dart';


class MyCart extends ChangeNotifier {
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
