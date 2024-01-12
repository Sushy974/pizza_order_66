import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../database/data_repository/data_repository.dart';
import '../../../database/models/article.dart';
import '../../../database/models/boisson.dart';
import '../../../database/models/dessert.dart';
import '../../../database/models/pizza.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(MenuState()) {
    on<MenuEvent>((event, emit) {});
    on<EnChargement>(_onEnChargement);
    on<EnFiltre>(_onEnFiltre);
  }
  final DataRepository _dataRepository;

  Future<FutureOr<void>> _onEnChargement(
    EnChargement event,
    Emitter<MenuState> emit,
  ) async {
    await emit.forEach(
      _dataRepository.getArticles(),
      onData: (data) => state.copyWith(
        listeArticle: data,
        listeArticleFiltrer: data,
      ),
    );
  }

  FutureOr<void> _onEnFiltre(
    EnFiltre event,
    Emitter<MenuState> emit,
  ) {
    print(event.menu);

    if (event.menu == Article) {
      emit(state.copyWith(listeArticleFiltrer: state.listeArticle));
    }
    if (event.menu == Pizza) {
      var list = state.listeArticle.whereType<Pizza>();
      emit(state.copyWith(listeArticleFiltrer: list.toList()));
    }
    if (event.menu == Boisson) {
      var list = state.listeArticle.whereType<Boisson>();
      emit(state.copyWith(listeArticleFiltrer: list.toList()));
    }
    if (event.menu == Dessert) {
      var list = state.listeArticle.whereType<Dessert>();
      emit(state.copyWith(listeArticleFiltrer: list.toList()));
    }
  }
}
