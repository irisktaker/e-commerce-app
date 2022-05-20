import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/firebase.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];

  // fetch products
  Future<void> fetchProducts() async {
    await firebaseFirestore
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _products = [];
      productSnapshot.docs.forEach((element) {
        _products.insert(
            0,
            Product(
                id: element.get('id'),
                title: element.get('title'),
                description: element.get('description'),
                price: element.get('price'),
                imageUrl: element.get('imageUrl'),
                productCategoryName: element.get('productCategoryName'),
                quantity: element.get('quantity')));
      });
    });
  }

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
