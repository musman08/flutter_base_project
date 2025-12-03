import 'package:base_project/globals/local_data/shared_pref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared_pref_provider.dart';

abstract interface class LocalDataService {
  Future<void> setAccessToken(String token);

  String? getAccessToken();

  // bool? getFirstTime();

  // Future<void> setUserId(String id);

  // String? getUserId();
  //
  // Future<void> setEmail(String email);
  //
  // String? getEmail();

  Future<void> setName(String name);

  String? getName();

  // Future<void> setNumber(String number);

  // String? getNumber();
  //
  // Future<void> setBio(String name);
  //
  // String? getBio();
  //
  // Future<void> setPic(String name);
  //
  // String? getPic();

  bool isLogin();

  // void setFirstTime(bool isFirstTime);

  Future<void> logout();
}

final localDataProvider = Provider<LocalDataService>(
  (ref) => SharedPrefService(
    ref.read(
      sharedPreferencesProvider,
    ),
  ),
);


