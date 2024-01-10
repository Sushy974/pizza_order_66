import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_order_66/database/data_repository/data_repository.dart';
import 'package:pizza_order_66/database/models/article.dart';

part 'pizza_manager_event.dart';
part 'pizza_manager_state.dart';

class PizzaManagerBloc extends Bloc<PizzaManagerEvent, PizzaManagerState> {
  PizzaManagerBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(const PizzaManagerState()) {
    on<PizzaManagerEvent>((event, emit) {});
    on<EnChargement>(_onEnChargement);
  }
  final DataRepository _dataRepository;
  Future<FutureOr<void>> _onEnChargement(
    EnChargement event,
    Emitter<PizzaManagerState> emit,
  ) async {
    await emit.forEach(
      _dataRepository.getArticles(),
      onData: (data) => state.copyWith(listeArticle: data),
    );
  }
}
