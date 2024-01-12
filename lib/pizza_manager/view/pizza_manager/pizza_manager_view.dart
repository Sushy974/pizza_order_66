import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/app/enum/enum_menu.dart';
import 'package:pizza_order_66/database/models/article.dart';
import 'package:pizza_order_66/database/models/boisson.dart';
import 'package:pizza_order_66/database/models/dessert.dart';
import 'package:pizza_order_66/database/models/pizza.dart';
import 'package:pizza_order_66/pizza_manager/bloc/pizza_manager_bloc/pizza_manager_bloc.dart';
import 'package:pizza_order_66/pizza_manager/view/form_article/form_article_page.dart';
import 'package:pizza_order_66/widget/boisson_view.dart';
import 'package:pizza_order_66/widget/dessert_view.dart';
import 'package:pizza_order_66/widget/pizza_view.dart';

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
                child: InkWell(
                  onTap: () => context.read<PizzaManagerBloc>().add(
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
            child: BlocListener<PizzaManagerBloc, PizzaManagerState>(
              listener: (context, state) {},
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
