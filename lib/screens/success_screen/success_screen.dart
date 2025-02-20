import 'package:flutter/material.dart';
import 'package:hey_follow_up/screens/home_container_screen/home_container_screen.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/styles/custom_text_style.dart';

import '../../util/styles/custom_button_style.dart';
import '../../widget/custom_elevated_button.dart';

class SuccessScreen extends StatelessWidget {

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SuccessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.0),
                  shape: BoxShape.circle
                ),
                padding: const EdgeInsets.all(30),
                child: Icon(
                  size: 40,
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Success!',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Congratulations! You have been successfully authenticated',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              CustomElevatedButton(
                onPressed: (){
                  HomeContainerScreen.show(context);
                },
                text: 'Continue',
                buttonStyle: CustomButtonStyles.fillWhite,
                buttonTextStyle: CustomTextStyles.textPrimaryBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
