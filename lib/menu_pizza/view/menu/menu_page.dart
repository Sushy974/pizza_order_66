import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/database/data_repository/data_repository.dart';
import 'package:pizza_order_66/menu_pizza/bloc/menu/menu_bloc.dart';
import 'package:pizza_order_66/menu_pizza/view/menu/menu_view.dart';

import '../../../app/app_bloc/app_bloc.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static Page<dynamic> page() => const MaterialPage<void>(child: MenuPage());

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
        create: (context) => MenuBloc(
          dataRepository: context.read<DataRepository>(),
        ),
        child: const MenuView(),
      ),
    );
  }
}
