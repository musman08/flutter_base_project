import 'dart:io';

import 'package:base_project/src/core/services/dto_to_model_services.dart';
import 'package:flutter/foundation.dart';
import '../../models/user_model.dart';
import 'auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'auth_api_repository.g.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository();

  @override
  Future<AppUser> handleSignUp(
    String name,
    String emailAddress,
    String password,
  ) async {
    try {
      return DtoServices.dtoToUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future handleAnonymousLogin() async {
    try {
      return DtoServices.dtoToUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppUser> handleSignIn(String emailAddress, String password) async {
    try {
      return DtoServices.dtoToUser();
    } catch (e) {
      if (kDebugMode) {
        print('Login failed: $e');
      }
      throw 'Something went wrong, please try again later.';
    }
  }

  @override
  Future<void> handleForgetPassword(String emailAddress) async {}

  @override
  Future<AppUser> signInWithGoogle([bool? withOutAnonymousUser]) async {
    try {
      return DtoServices.dtoToUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> refreshToken() async {
    // final refreshToken = await auth.currentUser?.getIdToken(true);
    // return refreshToken;
    return null;
  }

  @override
  Future<void> logout() async {}

  @override
  Future<String> uploadImage(File file) async {
    try {
      // String fileName = DateTime.now().toIso8601String();
      // final reference = _storageRef.child("ProfileImages/$fileName");
      // await reference.putFile(file);
      return '';
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppUser> signInWithApple() async {
    try {
      return DtoServices.dtoToUser();
    } catch (e) {
      throw 'Apple authorization cancelled';
    }
  }

  @override
  Future<void> deleteUserAccount(String? password) {
    throw UnimplementedError();
  }
}

@riverpod
FirebaseAuthRepository authRepository(Ref ref) {
  return FirebaseAuthRepository();
}
