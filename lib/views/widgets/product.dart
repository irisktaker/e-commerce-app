import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({Key? key, required this.index})
      : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductsProvider>(context);
    List<Product> _productsList = _productsProvider.products;

    return MaterialButton(
      height: 200,
      minWidth: 200,
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => DetailPage(),
        //   ),
        // );
      },
      padding: const EdgeInsets.only(bottom: SizeConfig.defaultPadding),
      child: Card(
        margin: const EdgeInsets.only(right: SizeConfig.defaultPadding / 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.defaultPadding / 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultPadding / 2),
                    image: DecorationImage(
                      image: AssetImage(
                        _productsList[index].imageUrl.toString(),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Badge(
                    toAnimate: true,
                    shape: BadgeShape.square,
                    badgeColor: AppColors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    badgeContent: const Text('New',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            Text(
              _productsList[index].title.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            Text(
              "\$${_productsList[index].price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
