part of 'form_article_bloc.dart';

class FormArticleState extends Equatable {
  const FormArticleState({
    this.nom = const TextInput.pure(),
    this.description = const TextInput.pure(),
    this.vegetarien = const BoolValide.pure(),
    this.basePizza = BasePizza.sauceTomate,
    this.listIngredient = const [],
    this.typeArticle = TypeArticle.pizza,
    this.status = FormzSubmissionStatus.initial,
  });

  final TextInput nom;
  final TextInput description;
  final BoolValide vegetarien;

  final BasePizza basePizza;
  final List<IngredientEnum> listIngredient;

  final TypeArticle typeArticle;

  final FormzSubmissionStatus status;

  FormArticleState copyWith({
    TextInput? nom,
    TextInput? description,
    BoolValide? vegetarien,
    BasePizza? basePizza,
    List<IngredientEnum>? listIngredient,
    TypeArticle? typeArticle,
    FormzSubmissionStatus? status,
  }) {
    return FormArticleState(
      nom: nom ?? this.nom,
      description: description ?? this.description,
      vegetarien: vegetarien ?? this.vegetarien,
      basePizza: basePizza ?? this.basePizza,
      listIngredient: listIngredient ?? this.listIngredient,
      typeArticle: typeArticle ?? this.typeArticle,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        nom,
        description,
        vegetarien,
        basePizza,
        listIngredient,
        typeArticle,
        status,
      ];
}
