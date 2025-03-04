import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/data/models/follow_up_model.dart';
import 'package:hey_follow_up/screens/follow_up_detail/widget/conversation_tip.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/injections/locator.dart';
import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';
import '../../../services/auth/auth_service.dart';
import '../../../widget/custom_dialogs.dart';

class FollowUpDetailVM extends BaseModel {
  final phoneNumberController = TextEditingController();
  final fullNameController = TextEditingController();
  final metWithController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final factsController = TextEditingController();
  final linkedInProfileController = TextEditingController();
  final nextStepsController = TextEditingController();
  String? selectedDate;

  bool isFollowUpNow = false;

  void init(FollowUpModel followup) {
    print('${followup.schedule}');
    isFollowUpNow = (followup.schedule ?? '').toLowerCase() == 'Follow Up Now'.toLowerCase();
    phoneNumberController.text = getLastTenDigits(followup.phoneNumber ?? '');
    fullNameController.text = followup.name ?? '';
    metWithController.text = followup.metWith ?? '';
    emailController.text = followup.email ?? '';
    locationController.text = followup.meetingLocation ?? '';
    factsController.text = followup.randomFacts ?? '';
    linkedInProfileController.text = followup.linkedinUrl ?? '';
  }

  String getLastTenDigits(String number) {
    return number.length > 10 ? number.substring(number.length - 10) : number;
  }

  final AuthService authService = sl<AuthService>();

  void update(BuildContext context, FollowUpModel followup) async {
    var payload = {
      "name": fullNameController.text,
      "metWith": metWithController.text,
      "email": emailController.text,
      "meetingLocation": locationController.text,
      "randomFacts": factsController.text,
      "linkedinUrl": linkedInProfileController.text,
    };

    print(payload);

    CustomDialogs.showLoadingBar(context);

    final result = await ApiClient.initialisePatchRequest(
      url: EndPoints.followup + '${followup.sId}',
      token: authService.token,
      data: payload,
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        popContext(context);
        CustomDialogs.showPopupDialogs(context,
            message: 'Follow Up Updated Successfully!', isSuccess: true);
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void popContext(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showHeardBackDialog(BuildContext context, FollowUpModel followup) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Follow-Up Status",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Have you received a response yet?",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: AppColor.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      if (value == true) {
        ConversationTip.show(context);
      } else {
        Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
          scheduleAnotherFollowUp(context, followup);
        });
      }
    });
  }

  void scheduleAnotherFollowUp(BuildContext context, FollowUpModel followup) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Schedule Another Follow-Up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Do you want to send a follow-up?",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: AppColor.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      if (value == true) {
        _generateMessage(context, followup);
      } else {}
    });
  }

  void _generateMessage(BuildContext context, FollowUpModel followup) async {
    CustomDialogs.showLoadingBar(context);

    final result = await ApiClient.initialiseGetRequest(
      url: EndPoints.getFollowupMessage + '${followup.sId}',
      token: authService.token,
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        var response = result.responseBody['response'] ?? {};
        var newMessage = response['newMessage'] ?? '';
        Share.share(newMessage);
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void updateFollowUp(BuildContext context, FollowUpModel followup, String followUpType) async {
    var payload = {
      "schedule": followUpType,
    };

    print(payload);

    CustomDialogs.showLoadingBar(context);

    final result = await ApiClient.initialisePatchRequest(
      url: EndPoints.followup + '${followup.sId}',
      token: authService.token,
      data: payload,
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        isFollowUpNow = !isFollowUpNow;
        notifyListeners();
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }
}
