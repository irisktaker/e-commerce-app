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
    ),
    Product(
      id: '1',
      title: "iPhone",
      description: "iPhone is one of the best selling clothes product",
      price: 999.90,
      imageUrl: 'assets/images/CatPhones.png',
      productCategoryName: 'Phones',
      quantity: 3,
    )
  ];

  // find the right product when clicking on it by product id
  Product findById(String productId) =>
      _products.firstWhere((e) => e.id == productId);

  List<Product> get products => _products;

  List<Product> findByCaCategory(String categoryName) {
    List _categoryList = products
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();

    return [..._categoryList];
  }
}
