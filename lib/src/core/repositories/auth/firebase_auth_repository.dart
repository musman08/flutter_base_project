import 'dart:io';

import 'package:base_project/src/core/services/dto_to_model_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../models/user_model.dart';
import '../../services/firebase_services.dart';
import '../../services/revenuecat_service.dart';
import 'auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final _storageRef = FirebaseStorage.instance.ref();

  String? get userId => auth.currentUser?.uid;

  User? get user => FirebaseAuth.instance.currentUser;

  @override
  Future<AppUser> handleSignUp(
    String name,
    String emailAddress,
    String password,
  ) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      await userCredential.user?.updateProfile(displayName: name);
      if (userCredential.user?.uid.isNotEmpty ?? false) {
        await FirebaseServices().createUser(
          userCredential.user?.uid ?? '',
          emailAddress,
          null,
          name,
        );
      }
      await RevenueCatService.instance.onAuthUserToRevenueCat(
        userCredential.user?.uid ?? '',
      );
      return DtoServices.userCredentialToUser(userCredential);
    } catch (e) {
      rethrow;
      // if (kDebugMode) {
      //   print('Sign-up failed: $e');
      // }
      // if (e is FirebaseAuthException) {
      //   return throw AppException(
      //     title: 'Error',
      //     message: e.message.toString(),
      //   );
      // }
      // if (e.toString().contains('The email address is badly formatted')) {
      //   throw 'The email address is not correct.';
      // }
      // throw "Error occured please try again";
    }
  }

  @override
  Future<AppUser> handleSignIn(String emailAddress, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await RevenueCatService.instance.onAuthUserToRevenueCat(
        result.user?.uid ?? '',
      );
      return DtoServices.userCredentialToUser(result);
    } catch (e) {
      // if (kDebugMode) {
      //   print('Login failed: $e');
      // }
      // throw 'Something went wrong, please try again later.';
      rethrow;
    }
  }

  @override
  Future<void> handleForgetPassword(String emailAddress) async {
    await auth.sendPasswordResetEmail(email: emailAddress);
  }

  @override
  Future<AppUser?> signInWithGoogle() async {
    try {
      // print('test====');
      // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      //
      // print('run-----');
      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser?.authentication;
      //
      // if (googleAuth != null) {
      //   print('get======');
      //   final credential = GoogleAuthProvider.credential(
      //     accessToken: googleAuth.accessToken,
      //     idToken: googleAuth.idToken,
      //   );
      //
      //   final result = await FirebaseAuth.instance.signInWithCredential(
      //     credential,
      //   );
      //
      //   if (result.user?.uid.isNotEmpty ?? false) {
      //     await FirebaseServices().createUser(
      //       result.user?.uid ?? '',
      //       result.user?.email ?? '',
      //       result.user?.photoURL,
      //       result.user?.displayName,
      //     );
      //     await RevenueCatService.instance.onAuthUserToRevenueCat(
      //       result.user?.uid ?? '',
      //     );
      //   }
      //   return DtoServices.userCredentialToUser(result);
      // }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    print(
      "===before logout==========${auth.currentUser == null}================",
    );
    await auth.signOut();
    // await handleGoogleSignOut();
    auth.currentUser?.reload();
  }

  @override
  Future<String> uploadImage(File file) async {
    try {
      String fileName = DateTime.now().toIso8601String();
      final reference = _storageRef.child("ProfileImages/$fileName");
      await reference.putFile(file);
      var url = '';
      try {
        url = await reference.getDownloadURL();
      } catch (_) {
        url = '';
      }
      return url;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppUser> signInWithApple() async {
    try {
      final appleCredentials = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final credential = OAuthProvider('apple.com').credential(
        idToken: appleCredentials.identityToken,
        accessToken: appleCredentials.authorizationCode,
      );

      final result = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      if (result.user?.uid.isNotEmpty ?? false) {
        await FirebaseServices().createUser(
          result.user?.uid ?? '',
          result.user?.email ?? '',
          result.user?.photoURL,
          result.user?.displayName,
        );
        await RevenueCatService.instance.onAuthUserToRevenueCat(
          result.user?.uid ?? '',
        );
      }
      return DtoServices.userCredentialToUser(result);
    } catch (e) {
      throw 'Apple authorization cancelled';
    }
  }

  @override
  Future<void> deleteUserAccount(String? password) async {
    await FirebaseServices().deleteUserAccount(password);
  }
}

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}
