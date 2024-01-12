import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class DataAuthApi {
  User? getCurrentUser();
  Future<void> register({
    required String email,
    required String pass,
  });
  Future<void> login({
    required String email,
    required String pass,
  });
  Future<void> logout();
}
