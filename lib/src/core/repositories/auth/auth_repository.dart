import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import '../../models/user_model.dart';
import 'auth_api_repository.dart';

part 'auth_repository.g.dart';

abstract interface class AuthRepository {
  Future<AppUser> handleSignIn(String emailAddress, String password);

  Future<AppUser> handleSignUp(
    String emailAddress,
    String password,
    String name,
  );

  Future handleForgetPassword(String emailAddress);

  Future<AppUser?> signInWithGoogle();

  Future<AppUser> signInWithApple();

  Future<void> logout();

  Future<String> uploadImage(File file);

  Future<void> deleteUserAccount(String? password);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return FirebaseAuthRepository();
}
