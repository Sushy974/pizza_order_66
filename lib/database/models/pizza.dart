import 'package:pizza_order_66/database/models/article.dart';

import 'base_pizza.dart';
import 'ingredient.dart';

class Pizza implements Article {
  Pizza({
    required this.description,
    required this.nom,
    required this.basePizza,
    required this.listeIngrediant,
    this.vegetarien,
    this.uid,
  });
  @override
  final String? uid;
  @override
  final String nom;
  @override
  final String description;

  final bool? vegetarien;
  final BasePizza basePizza;
  final List<Ingredient> listeIngrediant;
  @override
  Type get type => Pizza;

  @override
  Map<String, dynamic> toJSON() {
    return {
      'type': type.toString(),
      'nom': nom,
      'description': description,
      'base_pizza': basePizza.nom,
      'liste_ingredient': listeIngrediant
          .map((e) => {
                'nom': e.nom,
                'vegetarien': e.vegetarien,
              })
          .toList(),
    };
  }
}
