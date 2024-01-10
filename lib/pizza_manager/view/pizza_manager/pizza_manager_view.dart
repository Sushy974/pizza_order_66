import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/app/enum/enum_menu.dart';
import 'package:pizza_order_66/database/models/article.dart';
import 'package:pizza_order_66/database/models/base_pizza.dart';
import 'package:pizza_order_66/pizza_manager/bloc/pizza_manager_bloc/pizza_manager_bloc.dart';
import 'package:pizza_order_66/pizza_manager/view/form_article/form_article_page.dart';

import '../../../database/models/pizza.dart';

class PizzaManagerView extends StatelessWidget {
  const PizzaManagerView({super.key});

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
          flex: 5,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Theme.of(context).canvasColor,
                  child: const MenuListManager(),
                ),
              ),
            ],
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
                child: Text(
                  Menu.values.map((e) => e.name).toList()[index],
                  style: const TextStyle(
                    fontSize: 20,
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

class MenuListManager extends StatelessWidget {
  const MenuListManager({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PizzaManagerBloc>().state;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              primary: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            state.listeArticle[index].nom,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (state.listeArticle[index].type ==
                                        TypeArticle.pizza.type)
                                    ? (state.listeArticle[index] as Pizza)
                                        .basePizza
                                        .nom
                                    : '',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              if (state.listeArticle[index].type ==
                                  TypeArticle.pizza.type)
                                Icon(Icons.eco, color: Colors.lightGreen)
                              else
                                Icon(Icons.eco, color: Colors.transparent),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                child: Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    primary: true,
                                    itemBuilder: (context, indexIngredient) =>
                                        Text((state.listeArticle[index]
                                                as Pizza)
                                            .listeIngrediant[indexIngredient]
                                            .nom),
                                    itemCount:
                                        (state.listeArticle[index] as Pizza)
                                            .listeIngrediant
                                            .length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: state.listeArticle.length,
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(
                Size(1000, 100),
              ),
            ),
            onPressed: () => _popUp(context),
            child: const Text('Ajouter une Pizza'),
          ),
        ],
      ),
    );
  }

  Future<void> _popUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const FormArticlePage(),
    );
  }
}
