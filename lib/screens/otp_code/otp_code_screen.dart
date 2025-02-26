import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/success_screen/success_screen.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';

import '../../util/styles/custom_button_style.dart';
import 'view_model/otp_code_vm.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key, required this.payload});

  final Map<String, String> payload;

  static Future<void> show(BuildContext context, Map<String, String> payload) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => OtpCodeScreen(payload: payload,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<OtpCodeVm>(
        onModelReady: (p0) => p0.initialize(),
        onDestroy: (p0) => p0.dispose(),
        builder: (context, model, widget) {
          return Scaffold(
              backgroundColor: AppColor.kScaffoldBackgroundColor,
              body: Column(
                children: [
                  _buildTopOtpScreen(context),
                  _buildRemainingAuthScreen(context, model)
                ],
              ));
        });
  }

  Widget _buildTopOtpScreen(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Verification Code',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'We have sent the verification code to your email address',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemainingAuthScreen(BuildContext context, OtpCodeVm model) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Please enter the verification code',
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                onCompleted: (String pin){
                  payload['otpCode'] = pin;
                  model.verifyPin(context, payload);
                },
                defaultPinTheme: PinTheme(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.kGreyColor),
                      borderRadius: BorderRadius.circular(15)),
                ),
                focusedPinTheme: PinTheme(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.kPrimaryColor),
                      borderRadius: BorderRadius.circular(15)),
                ),
                separatorBuilder: (int value) {
                  return SizedBox(
                    width: 20,
                  );
                },
                length: 4,
                controller: model.pinInputController,
              ),
              SizedBox(height: 80),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Did not receive code? ',
                  ),
                 model.secondsRemaining == 0 ? InkWell(
                   onTap: () {},
                   child: Text(
                     'Resend',
                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                         color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold),
                   ),
                 ) : Text(
                    model.calculateRemainingTime(),
                  ),
                ],
              ),
              // SizedBox(height: 150),
              // CustomElevatedButton(
              //   onPressed: (){
              //     SuccessScreen.show(context);
              //   },
              //   text: 'Continue',
              //   buttonStyle: CustomButtonStyles.fillPrimary,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
