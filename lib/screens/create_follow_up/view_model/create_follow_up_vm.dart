import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:hey_follow_up/screens/create_follow_up/model/next_step_model.dart';
import 'package:hey_follow_up/util/constants.dart';
import 'package:hey_follow_up/util/image_base_64.dart';
import 'package:hey_follow_up/widget/custom_dialogs.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/injections/locator.dart';
import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';
import '../../../services/auth/auth_service.dart';

class CreateFollowUpVM extends BaseModel{

  XFile? file;

  final AuthService authService = sl<AuthService>();

  final List<NextStepModel> nextSteps = Constants.nextSteps;

  List<NextStepModel> selectedNextSteps = [];

  final phoneNumberController = TextEditingController();
  final fullNameController = TextEditingController();
  final metWithController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final factsController = TextEditingController();
  final linkedInProfileController = TextEditingController();
  final nextStepsController = TextEditingController();
  String? selectedDate;


  Country selectedCountry =
  CountryPickerUtils.getCountryByIso3Code('USA');

  updateCountry(Country country){
    selectedCountry = country;
    notifyListeners();
  }

  bool isFollowUpNow = true;

  toggleFollowUp(bool value){
    isFollowUpNow = value;
    notifyListeners();
  }

  int daysLater = -1;

  void selectFollowUpLaterDays(int index) {
    daysLater = index;
    notifyListeners();
  }

  void addNextStepItem(NextStepModel item) {
    selectedNextSteps = [item];
    // if(!selectedNextSteps.contains(item)){
    //   selectedNextSteps.add(item);
    // }
    notifyListeners();
  }

  void removeNextStepItem(NextStepModel item) {
    selectedNextSteps.remove(item);
    notifyListeners();
  }

  void addFile(XFile file) {
    this.file = file;
    notifyListeners();
  }

  Future<void> createFollowUp(BuildContext context) async{
    if(!isFollowUpNow && daysLater < 0){
      CustomDialogs.showPopupDialogs(context, message: 'Select days for follow up');
      return;
    }

    Map<String, dynamic> payload = {
      "name": fullNameController.text,
      "date": selectedDate,
      "metWith": metWithController.text,
      "email": emailController.text,
      "meetingLocation": locationController.text,
      "randomFacts": factsController.text,
      "linkedinUrl": linkedInProfileController.text,
      "nextSteps": selectedNextSteps.firstOrNull?.title,
      "schedule": isFollowUpNow ? 'Follow Up Now' : 'Follow Up Later',
      "phoneNumber": "+${selectedCountry.phoneCode}${phoneNumberController.text}"
    };

    if(!isFollowUpNow){
      payload['followUpDays'] = daysLater+1;
    }

    if(file != null){
      String? base64 = await ImageBase64.convertImageToBase64(File(file!.path));
      if(base64 != null){
        payload['image'] = base64;
      }
    }

    print(payload);

    CustomDialogs.showLoadingBar(context);

    final result = await ApiClient.initialisePostRequest(
      url: EndPoints.followup,
      token: authService.token,
      data: payload,
    );
    popContext(context);
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        clearAllText();
        popContext(context);
        CustomDialogs.showPopupDialogs(context, message: 'Follow Up Created Successfully!', isSuccess: true);
      }
    } else {
      CustomDialogs.showPopupDialogs(context, message: result.message);
    }
  }

  void popContext(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        DateTime finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        print("Selected Date & Time: $finalDateTime");
        String formattedDateTime = finalDateTime.toUtc().toIso8601String();
        selectedDate = formattedDateTime;
        notifyListeners();
      }
    }
  }

  void clearAllText(){
    phoneNumberController.clear();
    fullNameController.clear();
    metWithController.clear();
    emailController.clear();
    locationController.clear();
    factsController.clear();
    linkedInProfileController.clear();
    nextStepsController.clear();
    selectedDate = null;
    selectedNextSteps.clear();
    daysLater = -1;
    isFollowUpNow = true;
    notifyListeners();
  }

  void init() {
    clearAllText();
  }
}