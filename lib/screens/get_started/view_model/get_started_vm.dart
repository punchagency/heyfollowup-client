import 'dart:async';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetStartedVm extends BaseModel {

  bool isLogin = true;
  bool isShowPassword = true;
  bool rememberMe = false;

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  Country selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('234');

  switchTabs(){
    isLogin = !isLogin;
    notifyListeners();
  }

  Future<void> initialize(BuildContext context) async {
    Future.delayed(const Duration(seconds: 5))
        .whenComplete(() => print('doneee'));
  }

  void togglePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  updateCountry(Country country){
    selectedCountry = country;
    notifyListeners();
  }

}
