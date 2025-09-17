import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, String>> _cartItem = [];
  List<Map<String, String>> get cartItem => _cartItem;

  void addCart(Map<String, String> products) {
    _cartItem.add(products);
    notifyListeners();
  }

  void removeCart(Map<String, String> products) {
    _cartItem.remove(products);
  }

  void clearCart() {
    _cartItem.clear();
    notifyListeners();
  }

  int get totalItem => _cartItem.length;

  double get total {
    double total = 0;
    for (var item in _cartItem) {
      total += double.parse(item['price']!);
    }
    return total;
  }
}
