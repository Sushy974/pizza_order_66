import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/app/enum/enum_menu.dart';
import 'package:pizza_order_66/database/models/article.dart';
import 'package:pizza_order_66/database/models/boisson.dart';
import 'package:pizza_order_66/database/models/dessert.dart';
import 'package:pizza_order_66/database/models/pizza.dart';
import 'package:pizza_order_66/menu_pizza/bloc/menu/menu_bloc.dart';
import 'package:pizza_order_66/widget/boisson_view.dart';
import 'package:pizza_order_66/widget/dessert_view.dart';
import 'package:pizza_order_66/widget/pizza_view.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: const _Slector(),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Theme.of(context).primaryColor,
            child: const MenuList(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            child: const _Paiment(),
          ),
        ),
      ],
    );
  }
}

class _Slector extends StatelessWidget {
  const _Slector();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/images/pizzaOrder66.png'),
        ),
        SizedBox(
          height: 300,
          width: 200,
          child: ListView.builder(
            itemBuilder: (context, index) => Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () => context.read<MenuBloc>().add(
                        EnFiltre(menu: Menu.values[index].type),
                      ),
                  child: Text(
                    Menu.values.map((e) => e.name).toList()[index],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: Menu.values.length,
          ),
        ),
      ],
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MenuBloc>().state;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              primary: true,
              itemBuilder: (context, index) {
                if (state.listeArticleFiltrer[index].type ==
                    TypeArticle.pizza.type) {
                  return PizzaView(
                    pizza: state.listeArticleFiltrer[index] as Pizza,
                    index: index,
                  );
                }
                if (state.listeArticleFiltrer[index].type ==
                    TypeArticle.boisson.type) {
                  return BoissonView(
                    boisson: state.listeArticleFiltrer[index] as Boisson,
                    index: index,
                  );
                }
                if (state.listeArticleFiltrer[index].type ==
                    TypeArticle.dessert.type) {
                  return DessertView(
                    dessert: state.listeArticleFiltrer[index] as Dessert,
                    index: index,
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    color: Colors.white,
                    child: Text(
                      'Article inconnue : ${state.listeArticleFiltrer[index].uid}',
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              itemCount: state.listeArticleFiltrer.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _Paiment extends StatelessWidget {
  const _Paiment();

  @override
  Widget build(BuildContext context) {
    const textstyle = TextStyle(
      fontSize: 20,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ORDER',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Order 66 : ',
                    style: textstyle,
                  ),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, index) => const Text(
                      '- Pizza Marguerita',
                      style: textstyle,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Total :',
                            style: textstyle,
                          ),
                          Text(
                            '15 euros 17 centimes',
                            style: textstyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('PAYER'),
            ),
          ),
        ],
      ),
    );
  }
}
