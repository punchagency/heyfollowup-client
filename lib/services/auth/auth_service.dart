import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hey_follow_up/data/server/api_client.dart';
import 'package:hey_follow_up/services/auth/pref_utils.dart';

import '../../core/injections/injections.dart';
import '../../data/models/user_model.dart';
import '../../data/server/endpoints.dart';

class AuthService extends ChangeNotifier {
  String? _token;

  String? get token => _token;

  // String? get token => _token;

  set setToken(String token) => _token = token;

  UserModel? _user;

  UserModel? get user => _user;

  set setUser(UserModel user) => _user = user;

  refreshUser() async {
    final PrefUtils pref = sl<PrefUtils>();

    final result = await ApiClient.initialiseGetRequest(
      token: _token,
      url: EndPoints.userDetails,
    );
    if (result.isSuccessful) {
      var data = result.responseBody['data'] ?? {};
      pref.setUser(jsonEncode(data));
      UserModel user = UserModel.fromJson(data);
      setUser = user;
    } else {}
  }
}
