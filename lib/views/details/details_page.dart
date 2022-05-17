import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class DetailPage extends StatelessWidget {
  final Clothes clothes;
  const DetailPage(this.clothes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      clothes.productImageUrl.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(
                    SizeConfig.defaultRadius * 2,
                  ),
                ),
              ),
              Positioned(
                left: SizeConfig.defaultPadding,
                top: SizeConfig.defaultPadding * 3,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 0.1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(SizeConfig.defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  clothes.productName.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
