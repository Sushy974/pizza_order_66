part of 'app_bloc.dart';

enum AppStatus {
  admin,

  user,

  cook,
  unauthenticated,
}

class AppState {
  const AppState({
    this.user,
    this.appStatus = AppStatus.unauthenticated,
  });

  final User? user;

  final AppStatus appStatus;

  AppState copyWith({
    User? user,
    AppStatus? appStatus,
  }) {
    return AppState(
      user: user ?? this.user,
      appStatus: appStatus ?? this.appStatus,
    );
  }
}
