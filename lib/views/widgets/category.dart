import 'package:ecommerce_app/utils/constants/all_constants.dart';
import 'package:ecommerce_app/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: 180,
      width: SizeConfig.screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) => CategoryItem(index: index),
      ),
    );
  }
}
