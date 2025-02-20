import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';

class CreateFollowUpVM extends BaseModel{


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
}