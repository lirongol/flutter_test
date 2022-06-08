import 'package:flutter/cupertino.dart';

import '../models/cart_item_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItemModel> _cartItems = {};

  // test

  Map<String, CartItemModel> get cartItems {
    return {..._cartItems};
  }

  int get itemsCount {
    return _cartItems.length;
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addToCart(String productId, String title, double price) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (x) => CartItemModel(id: x.id, price: x.price, title: x.title, quantity: x.quantity + 1),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItemModel(id: DateTime.now().toString(), price: price, title: title, quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }
}
