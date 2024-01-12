import 'package:flutter/material.dart';
import 'package:pizza_order_66/database/models/dessert.dart';

class DessertView extends StatelessWidget {
  const DessertView({
    super.key,
    required this.dessert,
    required this.index,
  });

  final Dessert dessert;
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
              const Icon(Icons.cake_rounded, color: Colors.yellow),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dessert.nom,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      dessert.description,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.eco,
                      color:
                          dessert.vegetarien ? Colors.lightGreen : Colors.grey,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
