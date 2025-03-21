import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/data/models/follow_up_model.dart';
import 'package:hey_follow_up/screens/create_follow_up/model/next_step_model.dart';
import 'package:hey_follow_up/services/auth/auth_service.dart';
import 'package:hey_follow_up/util/constants.dart';
import '../../../core/injections/locator.dart';
import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';
import '../widget/custom_popup_item.dart';

class FollowUpsVm extends BaseModel {
  bool isLoading = true;

  final AuthService authService = sl<AuthService>();
  List<FollowUpModel> allFollowups = [];
  List<FollowUpModel> followups = [];

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();
    fetchFollowups();
    // Future.delayed(Duration(seconds: 2,)).whenComplete((){
    //   isLoading = false;
    //   notifyListeners();
    // });
  }

  fetchFollowups() async {
    selectedItem = -1;
    final result = await ApiClient.initialiseGetRequest(
      url: EndPoints.followup,
      token: authService.token,
    );
    print('${result.responseBody}');
    isLoading = false;
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        allFollowups = (result.responseBody['followUps'] as List)
            .map((element) => FollowUpModel.fromJson(element))
            .toList()
            .reversed
            .toList();
        followups = allFollowups;
      }
    }
    notifyListeners();
  }

  int selectedItem = -1;

  void showPopupMenu(BuildContext context, Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;

    await showMenu(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      context: context,
      position: RelativeRect.fromLTRB(left, top, left, top),
      items: [
        ...List.generate(Constants.nextSteps.length, (index) {
          return PopupMenuItem(
            onTap: () {
              selectedItem = index;
              notifyListeners();
              _filterItems(Constants.nextSteps[index]);
            },
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            value: index,
            child: CustomPopup(
              color: Constants.nextSteps[index].color,
              isSelected: selectedItem == index,
              title: Constants.nextSteps[index].title,
            ),
          );
        }),
        PopupMenuItem(
          onTap: () {
            selectedItem = -1;
            notifyListeners();
            _filterItems(null);
          },
          value: -1,
          child: CustomPopup(
            isSelected: false,
            title: 'Clear',
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  _filterItems(NextStepModel? nextStep) {
    if (nextStep == null) {
      followups = allFollowups;
    } else {
      followups = allFollowups.where((element) {
        return (element.nextSteps ?? '').toLowerCase().contains(nextStep.title.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  searchItem(String? term){
    if(term == null || term.isEmpty){
      followups = allFollowups;
    }else{
      followups = allFollowups.where((element) {
        return (element.name ?? '').toLowerCase().contains(term.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
