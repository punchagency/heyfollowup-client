import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/splash/view_model/splash_screen_vm.dart';
import 'package:hey_follow_up/util/image_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenVM>(
        onModelReady: (p0) => p0.initialize(context),
        builder: (context, model, widget) {
          return Scaffold(
            body: Center(
              child: Image.asset(
                ImageConstant.splashIcon,
              ),
            ),
          );
        });
  }
}
