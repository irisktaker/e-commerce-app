import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItems {
    // return _cartItems; // or
    return {..._cartItems};
  }

  // function to calculate all product price in cart
  double get totalAmount {
    double total = 0.0;
    // loop over each product added to the card
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }

  void addProductToCart(
      String productId, double price, String title, String image) {
    // in case the product is already in the cart we will update it only
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity + 1,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttr(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price,
            imageUrl: image),
      );
    }
    notifyListeners();
  }

  void reduceProductFromCart(
      String productId, String title, double price, String image) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity - 1,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl),
      );
    }
    notifyListeners();
  }

  void removeProductFromCart(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearProductsDataFromCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
