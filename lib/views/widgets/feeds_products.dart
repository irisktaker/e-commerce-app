import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/views/details/details_page.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class FeedsProducts extends StatefulWidget {
  const FeedsProducts(this.clothes, {Key? key}) : super(key: key);

  final Clothes clothes;

  @override
  State<FeedsProducts> createState() => _FeedsProductsState();
}

class _FeedsProductsState extends State<FeedsProducts> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 200,
      minWidth: 200,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(widget.clothes),
          ),
        );
      },
      padding: const EdgeInsets.only(bottom: SizeConfig.defaultPadding),
      child: Card(
        margin: const EdgeInsets.only(right: SizeConfig.defaultPadding / 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.defaultPadding / 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultPadding / 2),
                    image: DecorationImage(
                      image: AssetImage(
                        widget.clothes.productImageUrl.toString(),
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
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
                      onPressed: () {
                        print("Icon Clicked");
                      },
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.clothes.productName.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            Text(
              widget.clothes.productPrice.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}