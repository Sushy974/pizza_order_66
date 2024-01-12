import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/order_pizza/bloc/order_pizza_bloc/order_pizza_bloc.dart';
import 'package:pizza_order_66/order_pizza/view/order_pizza/order_pizza_view.dart';

class OrderPizzaPage extends StatelessWidget {
  const OrderPizzaPage({super.key});

  static Page<dynamic> page() =>
      const MaterialPage<void>(child: OrderPizzaPage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrderPizzaBloc(),
        child: const OrderPizzaView(),
      ),
    );
  }
}
