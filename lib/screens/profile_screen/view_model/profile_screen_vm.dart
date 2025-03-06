import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/services/auth/auth_service.dart';

import '../../../core/injections/locator.dart';
import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';
import '../../../widget/custom_dialogs.dart';
import '../../get_started/get_started_screen.dart';

class ProfileScreenVM extends BaseModel {
  bool isShowPassword = true;
  bool rememberMe = false;

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('234');

  final AuthService authService = sl<AuthService>();

  onInit(BuildContext context) {
    fullNameController.text = authService.user?.fullName ?? '';
    emailController.text = authService.user?.email ?? '';
    // phoneNumberController.text = authService.user?.phoneNumber ?? '';
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

  void deleteAccount(BuildContext context) async {
    CustomDialogs.showLoadingBar(context);
    final result = await ApiClient.initialiseDeleteRequest(
      url: EndPoints.userDetails,
      token: authService.token,
    );
    popContext(context);
    if (result.isSuccessful) {
      GetStartedScreen.show(context);
      CustomDialogs.showPopupDialogs(context, message: 'Account deleted successfully', isSuccess: true);
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void popContext(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Future<void> makePayment() async {
  //   try {
  //     //STEP 1: Create Payment Intent
  //    var paymentIntent = await createPaymentIntent('100', 'USD');
  //
  //     //STEP 2: Initialize Payment Sheet
  //     await Stripe.instance
  //         .initPaymentSheet(
  //
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //             paymentIntentClientSecret: paymentIntent![
  //             'client_secret'], //Gotten from payment intent
  //             style: ThemeMode.light,
  //             merchantDisplayName: 'Ikay'))
  //         .then((value) {});
  //
  //     //STEP 3: Display Payment sheet
  //     displayPaymentSheet();
  //   } catch (err) {
  //     throw Exception(err);
  //   }
  // }
}
