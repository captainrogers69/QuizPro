import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_quiz/services/auth_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User>(
  (ref) => AuthController(ref.read),
);

class AuthController extends StateNotifier<User> {
  final Reader _read;

  StreamSubscription<User> _authStateChangesSubscription;

  AuthController(this._read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription =
        _read(authServiceProvider).userChanges.listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    await _read(authServiceProvider).signInWithEmail(email, password, context);
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    await _read(authServiceProvider).signUpWithEmail(email, password, context);
  }

  Future<void> setUserName(String newUsername) async {
    await _read(authServiceProvider).setDisplayName(newUsername);
  }

  void signOut() async {
    await _read(authServiceProvider).signOut();
  }
}