import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_order_66/database/data_repository/data_repository.dart';
import 'package:pizza_order_66/database/models/article.dart';
import 'package:pizza_order_66/database/models/boisson.dart';
import 'package:pizza_order_66/database/models/dessert.dart';

import '../../../database/models/pizza.dart';

part 'pizza_manager_event.dart';
part 'pizza_manager_state.dart';

class PizzaManagerBloc extends Bloc<PizzaManagerEvent, PizzaManagerState> {
  PizzaManagerBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(const PizzaManagerState()) {
    on<PizzaManagerEvent>((event, emit) {});
    on<EnChargement>(_onEnChargement);
    on<EnFiltre>(_onEnFiltre);
  }
  final DataRepository _dataRepository;
  Future<FutureOr<void>> _onEnChargement(
    EnChargement event,
    Emitter<PizzaManagerState> emit,
  ) async {
    await emit.forEach(
      _dataRepository.getArticles(),
      onData: (data) =>
          state.copyWith(listeArticle: data, listeArticleFiltrer: data),
    );
  }

  FutureOr<void> _onEnFiltre(
    EnFiltre event,
    Emitter<PizzaManagerState> emit,
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
