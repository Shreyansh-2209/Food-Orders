import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final int price;
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  int get subtotal => price * quantity;
}

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems =>
      _items.fold(0, (total, current) => total + current.quantity);

  int get totalPrice =>
      _items.fold(0, (total, current) => total + current.subtotal);

  void addItem(CartItem item) {
    var existingItem = _items.firstWhere((i) => i.name == item.name,
        orElse: () => CartItem(name: '', price: 0, image: ''));
    if (existingItem.name == '') {
      _items.add(item);
    } else {
      existingItem.quantity++;
    }
    notifyListeners();
  }

  void decrementQuantity(CartItem item) {
  if (item.quantity > 1) {
  item.quantity--;
  } else {
  _items.remove(item);
  }
  notifyListeners();
  }
  void incrementQuantity(CartItem item) {
  if (item.quantity > 1) {
  item.quantity++;
  } else {
  _items.add(item);
  }
  notifyListeners();
  }

  void removeItem(CartItem item) {
  _items.remove(item);
  notifyListeners();
  }
}
