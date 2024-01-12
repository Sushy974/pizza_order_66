part of 'connexion_bloc.dart';

abstract class ConnexionEvent extends Equatable {
  const ConnexionEvent();
  @override
  List<Object?> get props => [];
}

class OnConnexion extends ConnexionEvent {}

class EmailChange extends ConnexionEvent {
  const EmailChange({required this.email});
  final String email;
}

class PassChange extends ConnexionEvent {
  const PassChange({required this.pass});
  final String pass;
}
