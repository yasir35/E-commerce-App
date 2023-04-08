import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = const [
    ["White Sneakers", "100", "assets/images/Sneakers.png", Colors.green],
    ["Denim Jacket", "100", "assets/images/Jackets.png", Colors.yellow],
    ["Chelsea Boots", "150", "assets/images/Boots.png", Colors.brown],
    ["Flannel Shirts", "60", "assets/images/Shirts.png", Colors.blue],
  ];
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
