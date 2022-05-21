import 'package:ecommerce_app/provider/orders_provider.dart';
import 'package:ecommerce_app/views/widgets/order/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const String id = 'order-screen';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _orderProvider.orders.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: _orderProvider.orders[index],
              child: const OrderItem(),
            );
          },
        ),
      ),
    );
  }
}
