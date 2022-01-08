import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_quiz/error_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final loadingStateProvider = StateProvider<bool>((ref) {
  return false;
});

abstract class BaseAuthenticationService {
  Stream<User> get userChanges;
  Future<void> signInWithEmail(
      String email, String password, BuildContext context);
  Future<void> signUpWithEmail(
      String email, String password, BuildContext context);
  Future<void> setDisplayName(String newUsername);
  User getCurrentUser();
  String getCurrentUID();
  Future<void> signOut();
}

final authServiceProvider =
    Provider<AuthenticatioSevice>((ref) => AuthenticatioSevice(ref.read));

class AuthenticatioSevice implements BaseAuthenticationService {
  final Reader _read;

  const AuthenticatioSevice(this._read);

  @override
  Stream<User> get userChanges => _read(firebaseAuthProvider).userChanges();

  // login with email and password
  @override
  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await _read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      context.read(loadingStateProvider).state = false;
      return ErrorHandler.errorDialog(context, e);
    }
  }

  @override
  Future<void> signUpWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await _read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      context.read(loadingStateProvider).state = false;
      return ErrorHandler.errorDialog(context, e);
    }
  }

  @override
  User getCurrentUser() {
    return _read(firebaseAuthProvider).currentUser;
  }

  @override
  Future<void> signOut() async {
    await _read(firebaseAuthProvider).signOut();
  }

  @override
  String getCurrentUID() {
    return _read(firebaseAuthProvider).currentUser.uid;
  }

  @override
  Future<void> setDisplayName(String newUsername) async {
    await _read(firebaseAuthProvider)
        .currentUser
        .updateDisplayName(newUsername);
  }


}