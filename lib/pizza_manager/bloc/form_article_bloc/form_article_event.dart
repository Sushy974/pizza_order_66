part of 'form_article_bloc.dart';

abstract class FormArticleEvent extends Equatable {
  const FormArticleEvent();
  @override
  List<Object?> get props => [];
}

class NomChange extends FormArticleEvent {
  const NomChange({required this.nom});
  final String nom;
}

class DescriptionChange extends FormArticleEvent {
  const DescriptionChange({required this.description});
  final String description;
}

class VegetarienChange extends FormArticleEvent {
  const VegetarienChange({required this.vegetarien});
  final bool vegetarien;
}

class BasePizzaChange extends FormArticleEvent {
  const BasePizzaChange({required this.basePizza});
  final BasePizza basePizza;
}

class AddIngredientPizzaChange extends FormArticleEvent {}

class TypeArticleChange extends FormArticleEvent {
  const TypeArticleChange({
    required this.typeArticle,
  });
  final TypeArticle typeArticle;
}

class RemouveIngredientPizzaChange extends FormArticleEvent {
  const RemouveIngredientPizzaChange({required this.index});
  final int index;
}

class ChangeIngredientPizzaChange extends FormArticleEvent {
  const ChangeIngredientPizzaChange(this.index, {required this.ingredient});
  final IngredientEnum ingredient;
  final int index;
}

class SaveArticle extends FormArticleEvent {}
