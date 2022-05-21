import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/utils/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/views/widgets/cart/cart_item.dart';
import 'package:ecommerce_app/views/widgets/cart/cart_empty.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uuid = const Uuid();
    final _cartProvider = Provider.of<CartProvider>(context);

    return _cartProvider.getCartItems.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                "Cart (${_cartProvider.getCartItems.length})",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(
                  onPressed: () => _cartProvider.clearProductsDataFromCart(),
                  icon: const Icon(
                    CupertinoIcons.trash,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _cartProvider.getCartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ChangeNotifierProvider.value(
                  value: _cartProvider.getCartItems.values.toList()[index],
                  child: CartItem(
                    productId: _cartProvider.getCartItems.keys.toList()[index],
                  ),
                );
              },
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        _cartProvider.getCartItems
                            .forEach((key, orderValue) async {
                          final orderID = uuid.v4();
                          await firebaseFirestore
                              .collection('orders')
                              .doc(orderID)
                              .set({
                            'order-id': orderID,
                            'user-id': firebaseAuth.currentUser!.uid,
                            'product-title': orderValue.title,
                            'product-price': orderValue.price,
                            'product-image': orderValue.imageUrl,
                            'product-quantity': orderValue.quantity,
                            'order-date': Timestamp.now(),
                          });
                        });
                      },
                      child: const Text(
                        "Checkout",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(width: SizeConfig.defaultPadding),
                  SizedBox(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Total Price",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$${_cartProvider.totalAmount.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Scaffold(
            body: CartEmpty(),
          );
  }
}
