import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/views/widgets/category.dart';
import 'package:ecommerce_app/views/widgets/tags_list.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/views/widgets/search_input.dart';
import 'package:ecommerce_app/views/widgets/all_products.dart';
import 'package:ecommerce_app/views/widgets/category_list.dart';
import 'package:ecommerce_app/views/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productProvider = Provider.of<ProductsProvider>(context);
    _productProvider.fetchProducts();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            CustomAppBar(),
            SearchInput(),
            TagsList(),
            Category(),
            CategoryList(),
            AllProductWidget(),
          ],
        ),
      ),
    );
  }
}
