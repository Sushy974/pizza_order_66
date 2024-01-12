part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object?> get props => [];
}

class Enchagement extends AppEvent {}

class Logout extends AppEvent {}

class UserChange extends AppEvent {
  const UserChange({required this.user});
  final User? user;
}
