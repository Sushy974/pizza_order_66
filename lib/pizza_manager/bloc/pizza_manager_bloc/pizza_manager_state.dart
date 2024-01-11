part of 'pizza_manager_bloc.dart';

class PizzaManagerState extends Equatable {
  const PizzaManagerState({
    this.listeArticle = const [],
    this.listeArticleFiltrer = const [],
  });

  final List<Article> listeArticle;
  final List<Article> listeArticleFiltrer;

  PizzaManagerState copyWith({
    List<Article>? listeArticle,
    List<Article>? listeArticleFiltrer,
  }) {
    return PizzaManagerState(
      listeArticle: listeArticle ?? this.listeArticle,
      listeArticleFiltrer: listeArticleFiltrer ?? this.listeArticleFiltrer,
    );
  }

  @override
  List<Object> get props => [
        listeArticle,
        listeArticleFiltrer,
      ];
}
