part of 'connexion_bloc.dart';

class ConnexionState extends Equatable {
  const ConnexionState({
    this.email = const Email.pure(),
    this.pass = const MotDePasse.pure(),
  });

  final Email email;
  final MotDePasse pass;

  ConnexionState copyWith({
    Email? email,
    MotDePasse? pass,
  }) {
    return ConnexionState(
      email: email ?? this.email,
      pass: pass ?? this.pass,
    );
  }

  @override
  List<Object> get props => [
        email,
        pass,
      ];
}
