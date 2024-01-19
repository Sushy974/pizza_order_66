import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/app/app_bloc/app_bloc.dart';
import 'package:pizza_order_66/order_pizza/bloc/order_pizza_bloc/order_pizza_bloc.dart';
import 'package:pizza_order_66/order_pizza/view/order_pizza/order_pizza_view.dart';

class OrderPizzaPage extends StatelessWidget {
  const OrderPizzaPage({super.key});

  static Page<dynamic> page() =>
      const MaterialPage<void>(child: OrderPizzaPage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          ElevatedButton(
            onPressed: () {
              return context.read<AppBloc>().add(
                    Logout(),
                  );
            },
            child: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => OrderPizzaBloc(),
        child: const OrderPizzaView(),
      ),
    );
  }
}
