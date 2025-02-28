import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/services/auth/auth_service.dart';

import '../../../core/injections/locator.dart';

class ProfileScreenVM extends BaseModel{

  bool isShowPassword = true;
  bool rememberMe = false;

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  Country selectedCountry =
  CountryPickerUtils.getCountryByPhoneCode('234');

  final AuthService authService = sl<AuthService>();


  onInit(BuildContext context){
    fullNameController.text = authService.user?.fullName ?? '';
    emailController.text = authService.user?.email ?? '';
    phoneNumberController.text = authService.user?.phoneNumber ?? '';
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