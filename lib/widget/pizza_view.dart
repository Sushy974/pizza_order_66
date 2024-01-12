import 'package:flutter/material.dart';
import 'package:pizza_order_66/database/models/base_pizza.dart';

import '../database/models/pizza.dart';

class PizzaView extends StatelessWidget {
  const PizzaView({
    super.key,
    required this.pizza,
    required this.index,
  });

  final Pizza pizza;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.local_pizza, color: Colors.red),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pizza.nom,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      pizza.description,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pizza.basePizza.nom,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    if (pizza.vegetarien == null)
                      Container()
                    else
                      Icon(
                        Icons.eco,
                        color:
                            pizza.vegetarien! ? Colors.lightGreen : Colors.grey,
                      )
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
                              Text(pizza.listeIngrediant[indexIngredient].nom),
                          itemCount: pizza.listeIngrediant.length,
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
    );
  }
}
