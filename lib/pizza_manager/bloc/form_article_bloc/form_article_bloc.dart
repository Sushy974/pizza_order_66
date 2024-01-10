import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:pizza_order_66/database/data_repository/data_repository.dart';
import 'package:pizza_order_66/database/models/article.dart';
import 'package:pizza_order_66/database/models/base_pizza.dart';
import 'package:pizza_order_66/database/models/ingredient.dart';
import 'package:pizza_order_66/formz/formz_input/bool_valide.dart';
import 'package:pizza_order_66/formz/formz_input/text_input.dart';

part 'form_article_event.dart';
part 'form_article_state.dart';

class FormArticleBloc extends Bloc<FormArticleEvent, FormArticleState> {
  FormArticleBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(FormArticleState()) {
    on<FormArticleEvent>((event, emit) {});
    on<SaveArticle>(_onSaveArticle);
    on<NomChange>(_onNomChange);
    on<DescriptionChange>(_onDescriptionChange);
    on<VegetarienChange>(_onVegetarienChange);
    on<BasePizzaChange>(_onBasePizzaChange);
    on<AddIngredientPizzaChange>(_onAddIngredientPizzaChange);
    on<RemouveIngredientPizzaChange>(_onRemouveIngredientPizzaChange);
    on<ChangeIngredientPizzaChange>(_onChangeIngredientPizzaChange);
    on<TypeArticleChange>(_onTypeArticleChange);
  }

  final DataRepository _dataRepository;

  Future<FutureOr<void>> _onSaveArticle(
    SaveArticle event,
    Emitter<FormArticleState> emit,
  ) async {
    emit(
      state.copyWith(status: FormzSubmissionStatus.inProgress),
    );
    await _dataRepository.saveArticle(
      Article.makeArticle(
        typeArticle: state.typeArticle,
        description: state.description.value ?? '',
        nom: state.nom.value ?? '',
        basePizza: state.basePizza,
        listeIngredient: state.listIngredient
            .map((ingredientEnum) => ingredientEnum.article as Ingredient)
            .toList(),
        vegetarien: state.vegetarien.value,
      ),
    );
    emit(
      state.copyWith(status: FormzSubmissionStatus.success),
    );
  }

  FutureOr<void> _onNomChange(
    NomChange event,
    Emitter<FormArticleState> emit,
  ) {
    emit(state.copyWith(nom: TextInput.dirty(event.nom)));
  }

  FutureOr<void> _onDescriptionChange(
    DescriptionChange event,
    Emitter<FormArticleState> emit,
  ) {
    emit(state.copyWith(description: TextInput.dirty(event.description)));
  }

  FutureOr<void> _onVegetarienChange(
    VegetarienChange event,
    Emitter<FormArticleState> emit,
  ) {
    emit(state.copyWith(vegetarien: BoolValide.dirty(event.vegetarien)));
  }

  FutureOr<void> _onBasePizzaChange(
    BasePizzaChange event,
    Emitter<FormArticleState> emit,
  ) {
    emit(state.copyWith(basePizza: event.basePizza));
  }

  FutureOr<void> _onAddIngredientPizzaChange(
    AddIngredientPizzaChange event,
    Emitter<FormArticleState> emit,
  ) {
    var list = <IngredientEnum>[];
    // list
    //   ..addAll(state.listIngredient)
    //   ..add(Ingredient.fromage);

    emit(
      state.copyWith(
        listIngredient: list
          ..addAll(state.listIngredient)
          ..add(IngredientEnum.fromage),
      ),
    );
  }

  FutureOr<void> _onChangeIngredientPizzaChange(
    ChangeIngredientPizzaChange event,
    Emitter<FormArticleState> emit,
  ) {
    var list = <IngredientEnum>[];
    // list..addAll(state.listIngredient);
    // list[event.index] = event.ingredient;
    emit(
      state.copyWith(
        listIngredient: list
          ..addAll(state.listIngredient)
          ..[event.index] = event.ingredient,
      ),
    );
  }

  FutureOr<void> _onRemouveIngredientPizzaChange(
    RemouveIngredientPizzaChange event,
    Emitter<FormArticleState> emit,
  ) {
    var list = <IngredientEnum>[];
    emit(
      state.copyWith(
        listIngredient: list
          ..addAll(state.listIngredient)
          ..removeAt(event.index),
      ),
    );
  }

  FutureOr<void> _onTypeArticleChange(
    TypeArticleChange event,
    Emitter<FormArticleState> emit,
  ) {
    emit(
      state.copyWith(
        typeArticle: event.typeArticle,
      ),
    );
  }
}
