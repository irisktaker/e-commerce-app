import 'package:ecommerce_app/provider/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/views/widgets/category/category.dart';
import 'package:ecommerce_app/views/widgets/tags_list.dart';
import 'package:ecommerce_app/provider/products_provider.dart';
import 'package:ecommerce_app/views/widgets/search/search_input.dart';
import 'package:ecommerce_app/views/widgets/product/all_products.dart';
import 'package:ecommerce_app/views/widgets/category/category_list.dart';
import 'package:ecommerce_app/views/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productProvider = Provider.of<ProductsProvider>(context);
    _productProvider.fetchProducts();
    final _orderProvider = Provider.of<OrdersProvider>(context);
    _orderProvider.fetchOrders();

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
