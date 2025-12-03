import 'package:shared_preferences/shared_preferences.dart';

import 'local_data_service.dart';

class SharedPrefService implements LocalDataService {
  SharedPrefService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  static const accessTokenKey = 'accessToken';
  static const userId = 'userId';
  static const userEmail = 'userEmail';
  static const firstLogin = 'firstLogin';
  static const nameKey = 'name';
  static const numberKey = 'number-key';
  static const bioKey = 'bio';
  static const imgKey = 'profile_img';

  @override
  Future<void> setAccessToken(String value) async {
    await sharedPreferences.remove(accessTokenKey);
    await sharedPreferences.setString(accessTokenKey, value);
  }

  @override
  String? getAccessToken() {
    final token = sharedPreferences.getString(accessTokenKey);
    return token;
  }

  @override
  Future<void> setUserId(String value) async {
    await sharedPreferences.setString(userId, value);
  }

  @override
  String? getUserId() {
    final id = sharedPreferences.getString(userId);
    return id;
  }

  @override
  Future<void> setEmail(String value) async {
    await sharedPreferences.setString(userEmail, value);
  }

  @override
  String? getEmail() {
    final mail = sharedPreferences.getString(userEmail);
    return mail;
  }

  @override
  Future<void> logout() async {
    await sharedPreferences.remove(accessTokenKey);
    await sharedPreferences.remove(userId);
    // await sharedPreferences.remove(localeKey);
  }

  @override
  bool isLogin() {
    if (getAccessToken() != null) {
      return true;
    }
    return false;
  }

  @override
  Future<void> setFirstTime(bool val) async {
    await sharedPreferences.setBool(firstLogin, val);
  }

  @override
  bool getFirstTime() {
    final isFirstTime = sharedPreferences.getBool(firstLogin);
    return isFirstTime ?? true;
  }

  @override
  String? getName() {
    return sharedPreferences.getString(nameKey);
  }

  @override
  Future<void> setName(String name) async {
    await sharedPreferences.setString(nameKey, name);
  }

  @override
  String? getBio() {
    return sharedPreferences.getString(bioKey);
  }

  @override
  Future<void> setBio(String bio) async {
    await sharedPreferences.setString(bioKey, bio);
  }

  @override
  String? getPic() {
    return sharedPreferences.getString(imgKey);
  }

  @override
  Future<void> setPic(String path) async {
    await sharedPreferences.setString(imgKey, path);
  }

  @override
  String? getNumber() {
    return sharedPreferences.getString(numberKey);
  }

  @override
  Future<void> setNumber(String number) async {
    await sharedPreferences.setString(numberKey, number);
  }
}
