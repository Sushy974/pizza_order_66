import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/menu_pizza/bloc/menu/menu_bloc.dart';
import 'package:pizza_order_66/menu_pizza/view/menu/menu_view.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MenuBloc(),
        child: const MenuView(),
      ),
    );
  }
}
