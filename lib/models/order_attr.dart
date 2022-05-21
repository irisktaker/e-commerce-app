import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class OrderAttr with ChangeNotifier {
  final String orderID;
  final String userID;
  final String? productID;
  final String title;
  final String price;
  final String imageURL;
  final String quantity;
  final Timestamp orderDate;

  OrderAttr({
    required this.orderID,
    required this.userID,
    this.productID,
    required this.title,
    required this.price,
    required this.imageURL,
    required this.quantity,
    required this.orderDate,
  });
}
