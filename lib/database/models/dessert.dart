import 'package:pizza_order_66/database/models/article.dart';

class Dessert implements Article {
  Dessert({
    required this.description,
    required this.nom,
    required this.vegetarien,
    this.uid,
  });
  @override
  final String? uid;
  @override
  final String nom;
  @override
  final String description;
  final bool vegetarien;

  @override
  Map<String, dynamic> toJSON() {
    return {
      'type': type.toString(),
      'nom': nom,
      'description': description,
      'vegetarien': vegetarien,
    };
  }

  @override
  Type get type => Dessert;
}
