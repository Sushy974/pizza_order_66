import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_order_66/database/data_api/data_auth_api.dart';

class DataAuthRepository {
  DataAuthRepository({required this.api});
  final DataAuthApi api;

  User? getCurrentUser() {
    return api.getCurrentUser();
  }

  Future<void> register({required String pass, required String email}) async {
    return api.register(
      email: email,
      pass: pass,
    );
  }

  Future<void> login({required String pass, required String email}) async {
    return api.login(
      email: email,
      pass: pass,
    );
  }

  Future<void> logout() async {
    return api.logout();
  }
}
