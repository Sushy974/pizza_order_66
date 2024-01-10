part of 'pizza_manager_bloc.dart';

class PizzaManagerState extends Equatable {
  const PizzaManagerState({
    this.listeArticle = const [],
  });

  final List<Article> listeArticle;

  PizzaManagerState copyWith({
    List<Article>? listeArticle,
  }) {
    return PizzaManagerState(
      listeArticle: listeArticle ?? this.listeArticle,
    );
  }

  @override
  List<Object> get props => [
        listeArticle,
      ];
}
