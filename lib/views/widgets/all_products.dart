import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';
import 'package:ecommerce_app/views/widgets/product.dart';
import 'package:flutter/material.dart';

class AllProductWidget extends StatelessWidget {
  AllProductWidget({Key? key}) : super(key: key);
  final clothesList = Clothes.generateClothes();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 280,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ProductsWidget(
                clothes: clothesList[index],
              ),
              separatorBuilder: (_, int index) => const SizedBox(
                width: SizeConfig.defaultPadding / 2,
              ),
              itemCount: clothesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
