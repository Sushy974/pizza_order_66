part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();
  @override
  List<Object?> get props => [];
}

class EnChargement extends MenuEvent {}

class EnFiltre extends MenuEvent {
  const EnFiltre({required this.menu});
  final Type menu;
  @override
  List<Object?> get props => [
        menu,
      ];
}
