import 'package:ecommerce_app/views/widgets/all_products.dart';
import 'package:ecommerce_app/views/widgets/category_list.dart';
import 'package:ecommerce_app/views/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/views/widgets/search_input.dart';
import 'package:ecommerce_app/views/widgets/tags_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const SearchInput(),
            const TagsList(),
            const CategoryList(),
            AllProductWidget(),
          ],
        ),
      ),
    );
  }
}
