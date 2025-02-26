import 'package:flutter/material.dart';
import 'package:hey_follow_up/screens/forgot_password/view_model/forgot_password_vm.dart';
import 'package:hey_follow_up/screens/otp_code/otp_code_screen.dart';
import 'package:hey_follow_up/util/styles/custom_button_style.dart';
import 'package:hey_follow_up/util/validation_functions.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:hey_follow_up/widget/custom_text_form_field.dart';

import '../../../util/color_scheme.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  final ForgotPasswordVm model;

  ForgotPasswordEmailScreen({super.key, required this.model});

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildEmail(),
              const SizedBox(
                height: 50,
              ),
              CustomElevatedButton(
                onPressed: () {
                  // if(_formKey.currentState?.validate() ?? false){
                  //   OtpCodeScreen.show(context);
                  // }
                  OtpCodeScreen.show(context, {});
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

  _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          onChanged: (String? value) {
            _formKey.currentState?.validate();
          },
          controller: model.emailController,
          hintText: "Enter email address",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
          validator: (value) {
            if (value == null ||
                (!Validator.isValidEmail(value, isRequired: true))) {
              return 'Enter a valid email';
            }
            return null;
          },
        )
      ],
    );
  }
}
