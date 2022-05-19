import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/views/details/details_page.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.productId}) : super(key: key);
  final String productId;

  // Get off and user from the CartAttr model USING PROVIDER
  // And wrap the cart_screen.dart with notifier
  // final String id;
  // final String productId;
  // final String title;
  // final double price;
  // final int quantity;
  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final _cartAttr = Provider.of<CartAttr>(context);
    final _cartProvider = Provider.of<CartProvider>(context);
    final _subtotal = _cartAttr.price * _cartAttr.quantity;

    return Card(
      margin: const EdgeInsets.only(bottom: SizeConfig.defaultPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.defaultRadius),
      ),
      child: SizedBox(
        height: 146.0,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, DetailPage.id,
                  arguments: productId),
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.defaultRadius),
                  image: DecorationImage(
                      image: AssetImage(_cartAttr.imageUrl), fit: BoxFit.cover),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(SizeConfig.defaultPadding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _cartAttr.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () => _cartProvider.removeProductFromCart(productId),
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SizeConfig.defaultPadding / 1.5),
                    Row(
                      children: [
                        const Text(
                          "Price: ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$${_cartAttr.price}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SizeConfig.defaultPadding / 2.5),
                    Row(
                      children: [
                        Text(
                          "Subtotal: ",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$${_subtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.buttonColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SizeConfig.defaultPadding / 2.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "Free Shipping ",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 16,
                          child: IconButton(
                            onPressed: () =>
                                _cartProvider.reduceProductFromCart(
                                    productId,
                                    _cartAttr.title,
                                    _cartAttr.price,
                                    _cartAttr.imageUrl),
                            padding: const EdgeInsets.all(0),
                            icon: const Icon(
                              CupertinoIcons.minus,
                              size: 18,
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.defaultRadius / 2)),
                          child: Container(
                            width: 50,
                            height: 20,
                            decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultRadius / 2)),
                            child: Center(
                                child: Text(
                              "${_cartAttr.quantity}",
                              style: const TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 16,
                          child: IconButton(
                            onPressed: () => _cartProvider.addProductToCart(
                              productId,
                              _cartAttr.price,
                              _cartAttr.title,
                              _cartAttr.imageUrl,
                            ),
                            padding: const EdgeInsets.all(0),
                            icon: const Icon(
                              CupertinoIcons.add,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
