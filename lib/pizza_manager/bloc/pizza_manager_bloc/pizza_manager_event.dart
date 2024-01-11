part of 'pizza_manager_bloc.dart';

abstract class PizzaManagerEvent extends Equatable {
  const PizzaManagerEvent();
  @override
  List<Object?> get props => [];
}

class EnChargement extends PizzaManagerEvent {}

class EnFiltre extends PizzaManagerEvent {
  const EnFiltre({required this.menu});
  final Type menu;
  @override
  List<Object?> get props => [
        menu,
      ];
}
