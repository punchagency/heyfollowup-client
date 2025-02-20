import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:hey_follow_up/screens/create_follow_up/model/next_step_model.dart';
import 'package:hey_follow_up/util/color_scheme.dart';

class CreateFollowUpVM extends BaseModel{

  final List<NextStepModel> nextSteps = [
    NextStepModel('Ignore', AppColor.nextStepIgnore),
    NextStepModel('Connect them to Someone', AppColor.nextStepConnectSomeone),
    NextStepModel('Catch Up', AppColor.nextStepCatchUp),
    NextStepModel('Schedule Follow Up', AppColor.nextStepScheduleFollowUp),
    NextStepModel('Send them info', AppColor.nextStepSendThemInfo),
  ];

  final List<NextStepModel> selectedNextSteps = [];

  final phoneNumberController = TextEditingController();

  Country selectedCountry =
  CountryPickerUtils.getCountryByPhoneCode('234');

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
    if(!selectedNextSteps.contains(item)){
      selectedNextSteps.add(item);
    }
    notifyListeners();
  }

  void removeNextStepItem(NextStepModel item) {
    selectedNextSteps.remove(item);
    notifyListeners();
  }
}