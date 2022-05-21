import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce_app/models/order_attr.dart';

class OrdersProvider with ChangeNotifier {
  List<OrderAttr> _orders = [];
  List<OrderAttr> get orders => _orders;

  // fetch orders
  Future<void> fetchOrders() async {
    await firebaseFirestore
        .collection('orders')
        .where('user-id', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((QuerySnapshot ordersSnapshot) {
      _orders = [];
      // ordersSnapshot.docs.forEach((element) {
      for (var element in ordersSnapshot.docs) {
        _orders.insert(
          0,
          OrderAttr(
            orderID: element.get('order-id'),
            userID: element.get('user-id'),
            title: element.get('product-title'),
            price: element.get('product-price').toString(),
            imageURL: element.get('product-image'),
            quantity: element.get('product-quantity').toString(),
            orderDate: element.get('order-date'),
          ),
        );
      }
    });

    notifyListeners();
  }
}
