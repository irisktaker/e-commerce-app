import 'package:ecommerce_app/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/order_attr.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderList = Provider.of<OrderAttr>(context);

    return Card(
      margin: const EdgeInsets.only(bottom: SizeConfig.defaultPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.defaultRadius),
      ),
      child: SizedBox(
        height: 146.0,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.defaultRadius),
                  image: DecorationImage(
                      image: NetworkImage(_orderList.imageURL),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(SizeConfig.defaultPadding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _orderList.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () => firebaseFirestore
                              .collection('orders')
                              .doc(_orderList.orderID)
                              .delete(),
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SizeConfig.defaultPadding / 1.5),
                    Row(
                      children: [
                        const Text(
                          "Price: ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$${_orderList.price}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SizeConfig.defaultPadding / 2.5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
