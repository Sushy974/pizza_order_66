import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_order_66/database/data_api/data_auth_api.dart';

class FirestoreAuthApi implements DataAuthApi {
  FirestoreAuthApi() {
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> register({
    required String email,
    required String pass,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print('User registered successfully');
    } catch (e) {
      print('Registration Error: $e');
    }
  }

  @override
  Future<void> login({
    required String email,
    required String pass,
  }) async {
    print(email);
    print(pass);
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print('User logged in successfully');
    } catch (e) {
      print('Login Error: $e');
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
    print('User logged out successfully');
  }

  @override
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
