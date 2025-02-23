import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item_model.dart';
import 'package:food_delivery_app/models/item_model.dart'; // Import the Item model

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Item item) {
    var existingItemIndex = _items.indexWhere((i) => i.item.id == item.id);
    if (existingItemIndex != -1) {
      _items[existingItemIndex].quantity++;
    } else {
      _items.add(CartItem(item: item));
    }
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.removeWhere((i) => i.item.id == item.id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
