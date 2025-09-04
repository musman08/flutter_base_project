import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user_model.dart';

part 'firebase_services.g.dart';

class FirebaseServices {
  final _presetCollection = FirebaseFirestore.instanceFor(
    databaseId: 'diveclickdb',
    app: Firebase.app(),
  ).collection('lutfiles');

  static final _usersCollection = FirebaseFirestore.instanceFor(
    databaseId: 'diveclickdb',
    app: Firebase.app(),
  ).collection('Users');

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> deleteUserAccount(String? password) async {
    final firebaseAuth = FirebaseAuth.instance;
    final providerData = firebaseAuth.currentUser?.providerData.first;

    if (AppleAuthProvider().providerId == providerData!.providerId) {
      await firebaseAuth.currentUser!.reauthenticateWithProvider(
        AppleAuthProvider(),
      );
      await firebaseAuth.currentUser?.delete();
      await firebaseAuth.signOut();
    } else if (GoogleAuthProvider().providerId == providerData.providerId) {
      final provider = GoogleAuthProvider();
      provider.setCustomParameters({'prompt': 'select_account'});
      await firebaseAuth.currentUser!.reauthenticateWithProvider(provider);
      await firebaseAuth.currentUser?.delete();
      await firebaseAuth.signOut();
    } else if (EmailAuthProvider.PROVIDER_ID == providerData.providerId &&
        (password?.isNotEmpty ?? false)) {
      final email = firebaseAuth.currentUser!.email!;
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password!,
      );
      print('credentials: ${credential}');
      final result = await firebaseAuth.currentUser!
          .reauthenticateWithCredential(credential);
      print('credddd: ${result.credential} ${result.user}');
      await firebaseAuth.currentUser?.delete();
      await firebaseAuth.signOut();
    }
  }

  Future<bool> isSubscriptionActive() async {
    final uid = _auth.currentUser?.uid;
    final doc = await _firestore.collection('subscriptions').doc(uid).get();
    return (doc.data()?['active'] ?? false);
  }

  Future<void> createUser(
    String userId,
    String email,
    String? photoURL,
    String? displayName,
  ) async {
    try {
      print('creating user: ${userId} $email');
      final docRef = _usersCollection.doc(userId);
      final snapshot = await docRef.get();
      if (snapshot.exists) return;

      final data = {
        'email': email,
        'userId': userId,
        'can_get_trial': true,
        'display_name': displayName,
        'profile_image': photoURL,
        'trial_data': {
          'has_trial': true,
          'trialStartedDate': DateTime.now().toString(),
        },
      };
      await docRef.set(data);
      print('creating user 3: not handle sign up');
    } catch (e) {
      print('we got error: $e');
    }
  }

  Future<void> updateTrialData(bool isTrialStarting) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId?.isEmpty ?? true) return;
    final docRef = _usersCollection.doc(userId);
    final data = {
      'can_get_trial': false,
      'trial_data': {
        'has_trial': isTrialStarting ? true : false,
        'trialStartedDate': DateTime.now().toString(),
      },
    };
    await docRef.update(data);
  }

  Future<void> updateUserData(String? name, String? profileImage) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId?.isEmpty ?? true) return;
    final docRef = _usersCollection.doc(userId);
    final data = {'display_name': name, 'profile_image': profileImage};
    await docRef.update(data);
  }

  Future<AppUser?> getUser(String userId) async {
    try {
      final docRef = _usersCollection.doc(userId);
      final snapshot = await docRef.get();
      print('app user getting user: $userId $snapshot');
      if (snapshot.exists) {
        final data = snapshot.data();
        print('userData: $data');
        return AppUser(
          userId: userId,
          profile: UserProfile(name: '', email: ''),
        );
        // return AppUser(
        //     id: data?['userId'] ?? '',
        //     canGetTrial: data?['can_get_trial'] ?? '',
        //     trialData: TrialData(
        //       isUserOnTrial: data?['trial_data']['has_trial'],
        //       trialStartedDate: data?['trial_data']['trialStartedDate'],
        //     ),
        //     profileImage: data?['profile_image'],
        //     displayName: data?['display_name'],
        //     email: data?['email'],
        //     exportedTime: exportedDate,
        //     currentTime: currentDate
        // );
      }
    } catch (e) {
      print('error here: $e');
      return null;
    }
    return null;
  }

  /// convert anonymous user to permanent user int firebase db
  // static Future<UserCredential> convertAnonymousUserWithAppleSignIn() async {
  //   try {
  //     final currentUser = FirebaseAuth.instance.currentUser;
  //     if (currentUser == null) throw 'No current user';
  //     final authProvider = AppleAuthProvider();
  //     authProvider.addScope('email');
  //     authProvider.addScope('name');
  //
  //     authProvider.addScope('fullName');
  //
  //     UserCredential userCredential = await currentUser.linkWithProvider(
  //       authProvider,
  //     );
  //
  //     User? authUser = userCredential.user;
  //     if (authUser != null) {
  //       return userCredential;
  //     } else {
  //       throw 'Apple Login failed';
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     var error = '';
  //     final code = e.code;
  //     if (code == 'network-request-failed') {
  //       error = 'Please check your internet connection';
  //     } else if (code == 'provider-already-linked') {
  //       error = 'The provider has already been linked to the user.';
  //     } else if (code == 'invalid-credential') {
  //       error = "The provider's credential is not valid.";
  //     } else if (code == 'credential-already-in-use') {
  //       error = 'The account is already linked to a Firebase User.';
  //     } else {
  //       error = e.message ?? 'Unable to sign in please try again later';
  //     }
  //     throw error;
  //   } catch (e) {
  //     throw 'Error occurred using Apple Sign In. Try again.';
  //   }
  // }
  //
  // static Future<UserCredential> convertAnonymousUserWithGoogleSignIn() async {
  //   try {
  //     final currentUser = FirebaseAuth.instance.currentUser;
  //     if (currentUser == null) {
  //       throw 'No current user';
  //     }
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //
  //     final GoogleSignInAccount? googleSignInAccount =
  //     await googleSignIn.signIn();
  //
  //     if (googleSignInAccount == null) {
  //       throw 'Google Sign-in Failed';
  //     }
  //     final GoogleSignInAuthentication googleSignInAuth =
  //     await googleSignInAccount.authentication;
  //     final authCredential = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuth.idToken,
  //       accessToken: googleSignInAuth.accessToken,
  //     );
  //     UserCredential userCredential = await currentUser.linkWithCredential(
  //       authCredential,
  //     );
  //     User? authUser = userCredential.user;
  //     if (authUser != null) {
  //       return userCredential;
  //     } else {
  //       throw ('Unable to sign up please try again later');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     var error = '';
  //     final code = e.code;
  //     if (code == 'network-request-failed') {
  //       error = 'Please check your internet connection';
  //     } else if (code == 'provider-already-linked') {
  //       error = 'The provider has already been linked to the user.';
  //     } else if (code == 'invalid-credential') {
  //       error = "The provider's credential is not valid.";
  //     } else if (code == 'credential-already-in-use') {
  //       error = 'The account is already linked to a Firebase User.';
  //     } else {
  //       error = e.message ?? 'Unable to sign in please try again later';
  //     }
  //     throw error;
  //   } catch (e) {
  //     if (e is PlatformException) {
  //       if (e.message == 'org.openid.appauth.general') {
  //         throw 'Your device time is not correct';
  //       } else if (e.code == "network_error") {
  //         throw 'Please check your internet connection';
  //       }
  //       throw e.details ?? 'Unable to sign in please try again later';
  //     }
  //     throw 'Unable to sign in please try again later';
  //   }
  // }
  //
  // static Future<UserCredential> convertAnonymousUserWithEmailSignIn({
  //   required String email,
  //   required String password,
  //   required String name,
  // }) async {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   try {
  //     final authCredential = EmailAuthProvider.credential(
  //       email: email,
  //       password: password,
  //     );
  //     final userCredential = await currentUser?.linkWithCredential(
  //       authCredential,
  //     );
  //     User? authUser = userCredential?.user;
  //     if (authUser != null) {
  //       await userCredential!.user?.updateProfile(displayName: name);
  //       return userCredential;
  //       // final String userToken = await authUser.getIdToken() ?? "";
  //     } else {
  //       throw ('--null authUser---Unable to sign up please try again later');
  //     }
  //   } on FirebaseException catch (e) {
  //     print("--------------------$e");
  //     var error = '';
  //     final code = e.code;
  //     if (code == 'network-request-failed') {
  //       error = 'Please check your internet connection';
  //     } else if (code == 'provider-already-linked') {
  //       error = 'The provider has already been linked to the user.';
  //     } else if (code == 'invalid-credential') {
  //       error = "Invalid email or password. Please try again.";
  //     } else if (code == 'credential-already-in-use') {
  //       error = 'The account is already linked to a Firebase User.';
  //     } else {
  //       error = e.message ?? 'Unable to sign in please try again later';
  //     }
  //     throw error;
  //   } catch (e) {
  //     throw 'Unable to sign up please try again later';
  //   }
  // }
}

@riverpod
FirebaseServices firebaseServices(Ref ref) => FirebaseServices();
