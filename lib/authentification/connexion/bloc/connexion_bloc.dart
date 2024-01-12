import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_order_66/database/data_repository/data_auth_repository.dart';
import 'package:pizza_order_66/formz/formz_input/email.dart';
import 'package:pizza_order_66/formz/formz_input/mot_de_passe.dart';

part 'connexion_event.dart';
part 'connexion_state.dart';

class ConnexionBloc extends Bloc<ConnexionEvent, ConnexionState> {
  ConnexionBloc({required DataAuthRepository dataAuthRepository})
      : _dataAuthRepository = dataAuthRepository,
        super(const ConnexionState()) {
    on<ConnexionEvent>((event, emit) {});
    on<OnConnexion>(_onConnexion);
    on<PassChange>(_onPassChange);
    on<EmailChange>(_onEmailChange);
  }
  final DataAuthRepository _dataAuthRepository;

  FutureOr<void> _onConnexion(
    OnConnexion event,
    Emitter<ConnexionState> emit,
  ) {
    _dataAuthRepository.login(
      pass: state.pass.value,
      email: state.email.value,
    );
  }

  FutureOr<void> _onPassChange(
    PassChange event,
    Emitter<ConnexionState> emit,
  ) {
    emit(
      state.copyWith(
        pass: MotDePasse.dirty(event.pass),
      ),
    );
  }

  FutureOr<void> _onEmailChange(
    EmailChange event,
    Emitter<ConnexionState> emit,
  ) {
    emit(
      state.copyWith(
        email: Email.dirty(event.email),
      ),
    );
  }
}
