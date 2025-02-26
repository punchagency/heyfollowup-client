import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/screens/otp_code/otp_code_screen.dart';
import 'package:injectable/injectable.dart';

import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';
import '../../../widget/custom_dialogs.dart';
import '../../get_started/get_started_screen.dart';

@lazySingleton
class ResetPasswordVm extends BaseModel {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isShowPassword = true;

  void togglePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  bool isShowConfirmPassword = true;

  void toggleConfirmPasswordVisibility() {
    isShowConfirmPassword = !isShowConfirmPassword;
    notifyListeners();
  }

  void doResetPassword(BuildContext context, String email) async {
    CustomDialogs.showLoadingBar(context);
    final result = await ApiClient.initialisePatchRequest(
      url: EndPoints.resetPassword,
      data: {
        "email": email,
        "newPassword": passwordController.text,
      },
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        GetStartedScreen.show(context);
        CustomDialogs.showPopupDialogs(context,
            message: 'Password changed successfully! Please login.',
            isSuccess: true);
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void popContext(BuildContext context) {
    Navigator.of(context).pop();
  }
}
