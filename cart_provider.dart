import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double get subtotal => price * quantity;
}

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [
    CartItem(name: 'Peach Milkshake', price: 60.0, quantity: 2),
    CartItem(name: 'Peach Milkshake', price: 60.0, quantity: 4),
    CartItem(name: 'Peach Milkshake', price: 60.0, quantity: 2),
  ];

  List<CartItem> get items => _items;

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.subtotal);

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }
}
