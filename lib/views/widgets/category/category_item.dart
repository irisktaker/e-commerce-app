// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/views/screens/feeds/feeds_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, required this.index}) : super(key: key);
  final int index;

  final List<Map<String, Object>> _categoryList = [
    {
      'category_name': 'Phones',
      'category_image': 'assets/images/CatPhones.png',
    },
    {
      'category_name': 'Clothes',
      'category_image': 'assets/images/CatClothes.jpg',
    },
    {
      'category_name': 'Laptops',
      'category_image': 'assets/images/CatLaptops.png',
    },
    {
      'category_name': 'Beauty',
      'category_image': 'assets/images/CatBeauty.jpg',
    },
    {
      'category_name': 'Furniture',
      'category_image': 'assets/images/CatFurniture.jpg',
    },
    {
      'category_name': 'Shoes',
      'category_image': 'assets/images/CatShoes.jpg',
    },
    {
      'category_name': 'Watches',
      'category_image': 'assets/images/CatWatches.jpg',
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              FeedsCategoryScreen.id,
              arguments: _categoryList[index]['category_name'],
            ),
            child: Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.only(
                right: SizeConfig.defaultPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.defaultPadding),
                image: DecorationImage(
                  image:
                      AssetImage("${_categoryList[index]['category_image']}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            child: Text(
              "${_categoryList[index]['category_name']}",
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
