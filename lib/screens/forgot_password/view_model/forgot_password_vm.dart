import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/screens/otp_code/otp_code_screen.dart';
import 'package:injectable/injectable.dart';

import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';
import '../../../widget/custom_dialogs.dart';

@lazySingleton
class ForgotPasswordVm extends BaseModel {
  // bool isEmail = true;

  final emailController = TextEditingController();

  // final phoneNumberController = TextEditingController();

  // Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('234');

  // switchTabs(){
  //   isEmail = !isEmail;
  //   notifyListeners();
  // }
  //
  // updateCountry(Country country){
  //   selectedCountry = country;
  //   notifyListeners();
  // }

  void doForgotPassword(BuildContext context) async {
    CustomDialogs.showLoadingBar(context);
    final result = await ApiClient.initialisePostRequest(
      url: EndPoints.forgotPassword,
      data: {
        "email": emailController.text,
      },
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        OtpCodeScreen.show(
          context,
          {"email": emailController.text, "context": "forgot-password"},
        );
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void popContext(BuildContext context) {
    Navigator.of(context).pop();
  }
}
