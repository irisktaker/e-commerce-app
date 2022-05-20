import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class DetailPage extends StatelessWidget {
  static const String id = 'detailPage';

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);
    final _productData = Provider.of<ProductsProvider>(context);
    final _productId = ModalRoute.of(context)!.settings.arguments
        as String; // args from navigator

    final _productAttr = _productData.findById(_productId);

    SizeConfig().init(context);

    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_productAttr.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(
                      SizeConfig.defaultRadius * 2,
                    ),
                  ),
                ),
                Positioned(
                  left: SizeConfig.defaultPadding,
                  top: SizeConfig.defaultPadding * 3,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 0.1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(SizeConfig.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _productAttr.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    _productAttr.description,
                    style: TextStyle(
                      height: 1.7,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(SizeConfig.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$${_productAttr.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: _cartProvider.getCartItems.containsKey(_productId)
                        ? 220
                        : 200,
                    decoration: BoxDecoration(
                      color: _cartProvider.getCartItems.containsKey(_productId)
                          ? AppColors.buttonColor
                          : AppColors.deepPurple,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.defaultRadius,
                      ),
                    ),
                    child: TextButton(
                      onPressed:
                          _cartProvider.getCartItems.containsKey(_productId)
                              ? null
                              : () => _cartProvider.addProductToCart(
                                  _productId,
                                  _productAttr.price,
                                  _productAttr.title,
                                  _productAttr.imageUrl),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            _cartProvider.getCartItems.containsKey(_productId)
                                ? "Review your Cart"
                                : "Add to Cart",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          const Icon(
                            Icons.shopping_cart_outlined,
                            size: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
