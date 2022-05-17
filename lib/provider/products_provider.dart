import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: '1',
      title: "Gucci",
      description: "Gucci is one of the best selling clothes product",
      price: 99.90,
      imageUrl: 'assets/images/dress1.jpeg',
      productCategoryName: 'clothes',
      quantity: 3,
    )
  ];

  List<Product> get products {
    return _products;
  }
}
