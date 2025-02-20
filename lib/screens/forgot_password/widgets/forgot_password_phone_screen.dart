import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/screens/forgot_password/view_model/forgot_password_vm.dart';
import 'package:hey_follow_up/util/styles/custom_button_style.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import '../../../util/color_scheme.dart';
import '../../../widget/custom_phone_number.dart';
import '../../otp_code/otp_code_screen.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  final ForgotPasswordVm model;

  ForgotPasswordPhoneScreen({super.key, required this.model});

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildPhoneNumber(),
              const SizedBox(
                height: 50,
              ),
              CustomElevatedButton(
                onPressed: () {
                  // if(_formKey.currentState?.validate() ?? false){
                  //   OtpCodeScreen.show(context);
                  // }
                  OtpCodeScreen.show(context);
                },
                text: 'Continue',
                buttonStyle: CustomButtonStyles.fillPrimary,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have account? ',
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColor.kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number'),
        const SizedBox(
          height: 5,
        ),
        CustomPhoneNumber(
          controller: model.phoneNumberController,
          country: model.selectedCountry,
          onTap: (Country country) {
            model.updateCountry(country);
          },
        )
      ],
    );
  }
}
