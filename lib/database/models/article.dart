import 'package:pizza_order_66/database/models/boisson.dart';
import 'package:pizza_order_66/database/models/dessert.dart';
import 'package:pizza_order_66/database/models/pizza.dart';

import 'base_pizza.dart';
import 'ingredient.dart';

abstract class Article {
  Article({
    required this.description,
    required this.nom,
    this.uid,
  });

  factory Article.makeArticle({
    required TypeArticle typeArticle,
    required String description,
    required String nom,
    required bool vegetarien,
    required BasePizza basePizza,
    required List<Ingredient> listeIngredient,
  }) {
    if (typeArticle.type == TypeArticle.pizza.type) {
      return Pizza(
        description: description,
        nom: nom,
        basePizza: basePizza,
        listeIngrediant: listeIngredient,
      );
    }
    if (typeArticle.type == TypeArticle.dessert.type) {
      return Dessert(
        description: description,
        nom: nom,
        vegetarien: vegetarien,
      );
    }
    return Boisson(description: description, nom: nom);
  }

  factory Article.fromJSON({
    required Map<String, dynamic> map,
    required String uid,
  }) {
    if (map['type'] == TypeArticle.pizza.type.toString()) {
      final listMaps = map['liste_ingredient'] as List<dynamic>;
      final listeIngredient = listMaps.map((ingredientMap) {
        final ingrMap = ingredientMap as Map<String, dynamic>;
        return getIngredientFromMap(ingrMap);
      }).toList();

      return Pizza(
        uid: uid,
        vegetarien: (map['vegi'] as bool?) ?? false,
        description: map['description'] as String,
        nom: map['nom'] as String,
        basePizza: getBasePizzaFromString(map['base_pizza'] as String),
        listeIngrediant: listeIngredient,
      );
    }

    if (map['type'] == TypeArticle.dessert.type.toString()) {
      return Dessert(
        uid: uid,
        description: map['description'] as String,
        nom: map['nom'] as String,
        vegetarien: map['vegetarien'] as bool,
      );
    }
    return Boisson(
      uid: uid,
      description: map['description'] as String,
      nom: map['nom'] as String,
    );
  }

  final String? uid;
  final String nom;
  final String description;

  Map<String, dynamic> toJSON();

  Type get type;
}

enum TypeArticle {
  pizza,
  boisson,
  dessert,
}

extension TypeArticleX on TypeArticle {
  Type get type {
    switch (this) {
      case TypeArticle.pizza:
        return Pizza;
      case TypeArticle.boisson:
        return Boisson;
      case TypeArticle.dessert:
        return Dessert;
    }
  }

  String get name {
    switch (this) {
      case TypeArticle.pizza:
        return 'Pizza';
      case TypeArticle.boisson:
        return 'Boisson';
      case TypeArticle.dessert:
        return 'Dessert';
    }
  }
}
