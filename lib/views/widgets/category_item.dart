// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/utils/constants/all_constants.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, required this.index}) : super(key: key);
  final int index;

  List<Map<String, Object>> categoryList = [
    {
      'categoryName': 'Phones',
      'categoryImage': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImage': 'assets/images/CatClothes.jpg',
    },
    {
      'categoryName': 'Laptops',
      'categoryImage': 'assets/images/CatLaptops.png',
    },
    {
      'categoryName': 'Beauty',
      'categoryImage': 'assets/images/CatBeauty.jpg',
    },
    {
      'categoryName': 'Furniture',
      'categoryImage': 'assets/images/CatFurniture.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImage': 'assets/images/CatShoes.jpg',
    },
    {
      'categoryName': 'Watches',
      'categoryImage': 'assets/images/CatWatches.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: SizeConfig.defaultPadding,
      ),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.only(
              right: SizeConfig.defaultPadding,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.defaultPadding),
              image: DecorationImage(
                image: AssetImage("${categoryList[index]['categoryImage']}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              "${categoryList[index]['categoryName']}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
