import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class DtoServices {
  static AppUser dtoToUser() {
    return AppUser(
      userId: '',
      profile: UserProfile(name: '', email: ''),
    );
  }

  static AppUser userCredentialToUser(UserCredential user) {
    return AppUser(
      userId: '',
      profile: UserProfile(name: '', email: ''),
    );
  }
}
