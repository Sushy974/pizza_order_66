part of 'pizza_manager_bloc.dart';

abstract class PizzaManagerEvent extends Equatable {
  const PizzaManagerEvent();
  @override
  List<Object?> get props => [];
}

class EnChargement extends PizzaManagerEvent {}
