import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/app/app_bloc/app_bloc.dart';
import 'package:pizza_order_66/database/data_repository/data_repository.dart';
import 'package:pizza_order_66/pizza_manager/bloc/pizza_manager_bloc/pizza_manager_bloc.dart';
import 'package:pizza_order_66/pizza_manager/view/pizza_manager/pizza_manager_view.dart';

class PizzaManagerPage extends StatelessWidget {
  const PizzaManagerPage({super.key});

  static Page<dynamic> page() =>
      const MaterialPage<void>(child: PizzaManagerPage());

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
        create: (context) => PizzaManagerBloc(
          dataRepository: context.read<DataRepository>(),
        )..add(EnChargement()),
        child: const PizzaManagerView(),
      ),
    );
  }
}
