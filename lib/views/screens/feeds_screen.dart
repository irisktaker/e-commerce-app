import 'package:ecommerce_app/utils/constants/all_constants.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/views/widgets/feeds_products.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clothesList = Clothes.generateClothes();
    return Scaffold(
      appBar: AppBar(title: const Text("Feeds Products")),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: SizeConfig.defaultPadding / 2,
        childAspectRatio: 200 / 300,
        children: List.generate(
            clothesList.length, (index) => FeedsProducts(clothesList[index])),
      ),
    );
  }
}
