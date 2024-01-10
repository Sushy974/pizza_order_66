import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/pizza_manager/bloc/pizza_manager_bloc/pizza_manager_bloc.dart';
import 'package:pizza_order_66/pizza_manager/view/pizza_manager/pizza_manager_view.dart';

import '../../../database/data_repository/data_repository.dart';

class PizzaManagerPage extends StatelessWidget {
  const PizzaManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PizzaManagerBloc(
          dataRepository: context.read<DataRepository>(),
        )..add(EnChargement()),
        child: const PizzaManagerView(),
      ),
    );
  }
}
