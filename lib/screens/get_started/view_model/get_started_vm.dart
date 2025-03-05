import 'dart:async';
import 'dart:convert';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/data/models/user_model.dart';
import 'package:hey_follow_up/data/server/api_client.dart';
import 'package:hey_follow_up/data/server/endpoints.dart';
import 'package:hey_follow_up/screens/home_container_screen/home_container_screen.dart';
import 'package:hey_follow_up/screens/otp_code/otp_code_screen.dart';
import 'package:hey_follow_up/services/auth/auth_service.dart';
import 'package:hey_follow_up/services/auth/pref_utils.dart';
import 'package:hey_follow_up/widget/custom_dialogs.dart';
import 'package:injectable/injectable.dart';
import '../../../core/injections/locator.dart';

@lazySingleton
class GetStartedVm extends BaseModel {
  bool isLogin = true;
  bool isShowPassword = true;
  bool rememberMe = false;
  bool acceptTerms = false;

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('234');

  switchTabs() {
    isLogin = !isLogin;
    notifyListeners();
  }

  Future<void> initialize(BuildContext context, int screen) async {
    if(screen == 0){
      isLogin = true;
    }else{
      isLogin = false;
    }
  }

  void togglePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  updateCountry(Country country) {
    selectedCountry = country;
    notifyListeners();
  }

  final AuthService authService = sl<AuthService>();
  final PrefUtils pref = sl<PrefUtils>();

  void doLogin(BuildContext context) async {
    CustomDialogs.showLoadingBar(context);
    final result = await ApiClient.initialisePostRequest(
      url: EndPoints.login,
      data: {
        "email": emailController.text,
        "password": passwordController.text
      },
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        var data = result.responseBody['user'];
        var token = result.responseBody['accessToken'];
        authService.setToken = token;
        UserModel user = UserModel.fromJson(data);
        authService.setUser = user;
        if (rememberMe) {
          pref.setToken(token);
          pref.setUser(jsonEncode(data));
          pref.setIsLogin(true);
        }
        HomeContainerScreen.show(context);
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void doSignUp(BuildContext context) async {
    CustomDialogs.showLoadingBar(context);
    final result = await ApiClient.initialisePostRequest(
      url: EndPoints.signup,
      data: {
        "full_name": fullNameController.text,
        "email": emailController.text,
        // "phoneNumber": "+${selectedCountry.phoneCode}${phoneNumberController.text}",
        "password": passwordController.text
      },
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        OtpCodeScreen.show(context,
            {"email": emailController.text, "context": "signup"});
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void popContext(BuildContext context) {
    Navigator.of(context).pop();
  }

  toggleAcceptTerms() {
    acceptTerms = !acceptTerms;
    notifyListeners();
  }
}
