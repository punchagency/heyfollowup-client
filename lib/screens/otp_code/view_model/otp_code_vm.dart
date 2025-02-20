import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OtpCodeVm extends BaseModel {

  final pinInputController = TextEditingController();

  int secondsRemaining = 60;

  Timer? timer;

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
}
