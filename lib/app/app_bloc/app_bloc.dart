import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_order_66/database/data_repository/data_auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required DataAuthRepository dataAuthRepository})
      : _dataAuthRepository = dataAuthRepository,
        super(const AppState()) {
    on<AppEvent>((event, emit) {});
    on<Enchagement>(_onEnchargement);
    on<UserChange>(_onUserChange);
    on<Logout>(_onLogout);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      add(UserChange(user: user));
    });
  }
  final DataAuthRepository _dataAuthRepository;

  FutureOr<void> _onEnchargement(
    Enchagement event,
    Emitter<AppState> emit,
  ) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {});
  }

  Future<FutureOr<void>> _onUserChange(
    UserChange event,
    Emitter<AppState> emit,
  ) async {
    emit(
      state.copyWith(user: event.user),
    );
    if (event.user != null) {
      emit(state.copyWith(appStatus: AppStatus.user));
      await event.user?.getIdTokenResult().then((IdTokenResult tokenResult) {
        if (tokenResult.claims!.containsKey('role')) {
          final userRole = tokenResult.claims?['role'];
          if (userRole == 'admin') {
            emit(state.copyWith(appStatus: AppStatus.admin));
          }
          if (userRole == 'cook') {
            emit(state.copyWith(appStatus: AppStatus.cook));
          }
        }
      });
    }
    if (event.user == null) {
      emit(state.copyWith(appStatus: AppStatus.unauthenticated));
    }
  }

  FutureOr<void> _onLogout(
    Logout event,
    Emitter<AppState> emit,
  ) {
    _dataAuthRepository.logout();
  }
}
