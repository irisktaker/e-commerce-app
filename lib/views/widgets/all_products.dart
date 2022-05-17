import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/views/widgets/product.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class AllProductWidget extends StatelessWidget {
  const AllProductWidget({Key? key}) : super(key: key);
  //..
  // final clothesList = Clothes.generateClothes();

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductsProvider>(context);
    List<Product> _productsList = _productsProvider.products;

    return Column(
      children: [
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ProductsWidget(
              index: index,
            ),
            separatorBuilder: (_, int index) => const SizedBox(
              width: SizeConfig.defaultPadding / 2,
            ),
            itemCount: _productsList.length,
          ),
        ),
      ],
    );
  }
}
