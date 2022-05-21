import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/views/widgets/feeds/feeds_products.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductsProvider>(context);
    List<Product> _productsList = _productsProvider.products;

    return Scaffold(
      appBar: AppBar(title: const Text("Feeds Products")),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: SizeConfig.defaultPadding / 2,
        childAspectRatio: 200 / 300,
        children: List.generate(
          _productsList.length,
          (index) => ChangeNotifierProvider.value(
              value: _productsList[index], child: const FeedsProducts()),
        ),
      ),
    );
  }
}
