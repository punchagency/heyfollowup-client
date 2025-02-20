import 'package:flutter/material.dart';
import 'package:hey_follow_up/screens/get_started/view_model/get_started_vm.dart';
import 'package:hey_follow_up/screens/otp_code/otp_code_screen.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/styles/custom_button_style.dart';
import 'package:hey_follow_up/util/validation_functions.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:hey_follow_up/widget/custom_text_form_field.dart';

import '../../forgot_password/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final GetStartedVm model;

  LoginScreen({super.key, required this.model});

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
                height: 20,
              ),
              _buildPassword(),
              const SizedBox(
                height: 10,
              ),
              _buildThirdSection(context),
              const SizedBox(
                height: 200,
              ),
              CustomElevatedButton(
                onPressed: (){
                  // if(_formKey.currentState?.validate() ?? false){
                  //   OtpCodeScreen.show(context);
                  // }
                  OtpCodeScreen.show(context);
                },
                text: 'Log In',
                buttonStyle: CustomButtonStyles.fillPrimary,
              )
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
          onChanged: (String? value){
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

  _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          controller: model.passwordController,
          hintText: 'Password',
          onChanged: (String? value){
            _formKey.currentState?.validate();
          },
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              model.togglePasswordVisibility();
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 12, 14, 12),
              child: Icon(
                model.isShowPassword ? Icons.visibility : Icons.visibility_off,
                color: AppColor.kGreyColor,
              ),
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 50,
          ),
          obscureText: model.isShowPassword,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
          validator: (value) {
            // if (value == null || (!isValidPassword(value, isRequired: true))) {
            if (value == null || value.isEmpty) {
              return 'Password cannot be empty';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildThirdSection(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: AppColor.kPrimaryColor,
              value: model.rememberMe,
              onChanged: (value) => model.toggleRememberMe(),
            ),
            Text(
              'Remember Me',
            ),
          ],
        ),
        InkWell(
          onTap: () {
            ForgotPasswordScreen.show(context);
          },
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
