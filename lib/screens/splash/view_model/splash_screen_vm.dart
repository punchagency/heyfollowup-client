import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/screens/get_started/get_started_screen.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SplashScreenVM extends BaseModel {
  Future<void> initialize(BuildContext context) async {
    Future.delayed(const Duration(seconds: 5))
        .whenComplete(() => GetStartedScreen.show(context));
  }
}
