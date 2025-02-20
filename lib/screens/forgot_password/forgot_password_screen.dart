import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/forgot_password/view_model/forgot_password_vm.dart';
import 'package:hey_follow_up/screens/forgot_password/widgets/forgot_password_email_screen.dart';
import 'package:hey_follow_up/screens/forgot_password/widgets/forgot_password_phone_screen.dart';
import 'package:hey_follow_up/util/color_scheme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ForgotPasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordVm>(
        // onModelReady: (p0) => p0.initialize(context),
        builder: (context, model, widget) {
      return Scaffold(
          backgroundColor: AppColor.kScaffoldBackgroundColor,
          body: Column(
            children: [
              _buildTopGetStarted(context),
              _buildRemainingAuthScreen(context, model)
            ],
          ));
    });
  }

  Widget _buildTopGetStarted(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
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
              'Reset Password',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'An OTP code will be sent to your email/phone number',
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

  Widget _buildRemainingAuthScreen(
      BuildContext context, ForgotPasswordVm model) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: _buildTabs(context, model),
      ),
    );
  }

  Widget _buildTabs(BuildContext context, ForgotPasswordVm model) {
    return Column(
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.kPrimaryColor)),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    model.switchTabs();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: model.isEmail
                          ? AppColor.kPrimaryColor
                          : AppColor.kWhiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        'Email',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: model.isEmail
                                ? AppColor.kWhiteColor
                                : AppColor.kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    model.switchTabs();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: model.isEmail
                          ? AppColor.kWhiteColor
                          : AppColor.kPrimaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        'Phone Number',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: model.isEmail
                                ? AppColor.kPrimaryColor
                                : AppColor.kWhiteColor,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        model.isEmail ? ForgotPasswordEmailScreen(model: model) : ForgotPasswordPhoneScreen(model: model)
      ],
    );
  }
}
