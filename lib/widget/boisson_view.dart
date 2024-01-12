import 'package:flutter/material.dart';
import 'package:pizza_order_66/database/models/boisson.dart';

class BoissonView extends StatelessWidget {
  const BoissonView({
    super.key,
    required this.boisson,
    required this.index,
  });

  final Boisson boisson;
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
              const Icon(Icons.emoji_food_beverage_rounded, color: Colors.blue),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      boisson.nom,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      boisson.description,
                      style: const TextStyle(
                        fontSize: 12,
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
