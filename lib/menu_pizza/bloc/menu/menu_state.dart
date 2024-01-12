part of 'menu_bloc.dart';

class MenuState extends Equatable {
  const MenuState({
    this.listeArticle = const [],
    this.listeArticleFiltrer = const [],
  });

  final List<Article> listeArticle;
  final List<Article> listeArticleFiltrer;

  MenuState copyWith({
    List<Article>? listeArticle,
    List<Article>? listeArticleFiltrer,
  }) {
    return MenuState(
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
