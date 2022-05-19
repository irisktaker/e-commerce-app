import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/views/widgets/feeds_products.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class FeedsCategoryScreen extends StatelessWidget {
  const FeedsCategoryScreen({Key? key}) : super(key: key);
  static const String id = 'feeds_category_screen';

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductsProvider>(context);
    final _categoryName = ModalRoute.of(context)!.settings.arguments as String;
    final _productsList = _productsProvider.findByCaCategory(_categoryName);

    return Scaffold(
      appBar: AppBar(title: const Text("Feeds Products")),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: SizeConfig.defaultPadding),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: SizeConfig.defaultPadding / 2,
          childAspectRatio: 200 / 300,
          children: List.generate(
            _productsList.length,
            (index) => ChangeNotifierProvider.value(
                value: _productsList[index], child: const FeedsProducts()),
          ),
        ),
      ),
    );
  }
}
