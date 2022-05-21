import 'package:ecommerce_app/utils/constants/all_constants.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.4,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/emptycart.png"),
            ),
          ),
        ),
        const Text(
          "Your cart is currently empty",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: SizeConfig.defaultPadding * 3,
        ),
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: AppColors.deepPurple,
            borderRadius: BorderRadius.circular(
              SizeConfig.defaultRadius,
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Shop Now",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
