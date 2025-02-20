import 'dart:async';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgotPasswordVm extends BaseModel {

  bool isEmail = true;

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Country selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('234');

  switchTabs(){
    isEmail = !isEmail;
    notifyListeners();
  }

  updateCountry(Country country){
    selectedCountry = country;
    notifyListeners();
  }
}
