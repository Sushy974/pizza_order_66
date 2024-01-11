import 'package:pizza_order_66/database/models/article.dart';

class Boisson implements Article {
  Boisson({
    required this.description,
    required this.nom,
    this.uid,
  });
  @override
  final String? uid;
  @override
  final String nom;
  @override
  final String description;
  @override
  Type get type => Boisson;

  @override
  Map<String, dynamic> toJSON() {
    return {
      'type': type.toString(),
      'nom': nom,
      'description': description,
    };
  }
}
