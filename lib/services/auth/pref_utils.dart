//ignore: unused_import    
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    _init();
  }

  Future<void> _init() async {
    if(_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      // print('SharedPreference Initialized');
    }
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  setFirstTimeUser(bool value) {
    _sharedPreferences!.setBool('first_time_user', value);
  }

  bool firstTimeUser() {
    return _sharedPreferences!.getBool('first_time_user') ?? true;
  }

  setIsLogin(bool value) {
    _sharedPreferences!.setBool('is_login', value);
  }

  bool isLogin() {
    return _sharedPreferences!.getBool('is_login') ?? false;
  }


  setToken(String token) {
    _sharedPreferences!.setString('access_token', token);
  }

  String getToken() {
    return _sharedPreferences!.getString('access_token') ?? '';
  }

  setUser(String user) {
    _sharedPreferences!.setString('user_profile', user);
  }

  String getUser() {
    return _sharedPreferences!.getString('user_profile') ?? '';
  }

  setUserEmail(String email) {
    _sharedPreferences!.setString('user_email', email);
  }

  String userEmail() {
    return _sharedPreferences!.getString('user_email') ?? '';
  }

  setUserPassword(String password) {
    _sharedPreferences!.setString('user_password', password);
  }

  String userPassword() {
    return _sharedPreferences!.getString('user_password') ?? '';
  }


}
    