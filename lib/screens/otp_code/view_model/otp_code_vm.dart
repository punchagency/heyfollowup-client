import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/screens/get_started/get_started_screen.dart';
import 'package:hey_follow_up/screens/reset_password/reset_password_screen.dart';
import 'package:injectable/injectable.dart';

import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';
import '../../../widget/custom_dialogs.dart';

@lazySingleton
class OtpCodeVm extends BaseModel {

  final pinInputController = TextEditingController();

  int secondsRemaining = 60;

  Timer? timer;

  void initialize(){
    pinInputController.clear();
    waitingTime();
  }
  void waitingTime() {

    if(timer != null){
      timer?.cancel();
      secondsRemaining = 60;
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (_) {
        if (secondsRemaining != 0) {
          secondsRemaining--;
          notifyListeners();
        } else {
        }
      },
    );
  }


  String calculateRemainingTime() {

    int minutes = (secondsRemaining~/60);
    int seconds = secondsRemaining % 60;

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void verifyPin(BuildContext context, Map<String, String> payload) async {
    CustomDialogs.showLoadingBar(context);
    final result = await ApiClient.initialisePostRequest(
      url: EndPoints.verifyOTP,
      data: payload,
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        if(payload['context'] == 'forgot-password'){
          ResetPasswordScreen.show(context, payload['email'] ?? '');
        }else {
          GetStartedScreen.show(context);
        }
        CustomDialogs.showPopupDialogs(context, message: 'OTP Verified successfully! Please login.', isSuccess: true);
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void popContext(BuildContext context) {
    Navigator.of(context).pop();
  }
}
