import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get cartItems {
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
}
