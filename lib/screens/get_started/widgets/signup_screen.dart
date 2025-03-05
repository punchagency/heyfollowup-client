import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/screens/get_started/view_model/get_started_vm.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/styles/custom_button_style.dart';
import 'package:hey_follow_up/util/validation_functions.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:hey_follow_up/widget/custom_text_form_field.dart';

import '../../../widget/custom_dialogs.dart';
import '../../../widget/custom_phone_number.dart';

class SignUpScreen extends StatelessWidget {
  final GetStartedVm model;

  SignUpScreen({super.key, required this.model});

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildFullName(),
              const SizedBox(
                height: 20,
              ),
              _buildEmail(),
              // const SizedBox(
              //   height: 20,
              // ),
              // _buildPhoneNumber(),
              const SizedBox(
                height: 20,
              ),
              _buildPassword(),
              const SizedBox(
                height: 10,
              ),
              _buildLastSection(context),
              const SizedBox(
                height: 50,
              ),
              CustomElevatedButton(
                onPressed: (){
                 if (_formKey.currentState?.validate() ?? false){
                   if(!model.acceptTerms){
                     CustomDialogs.showPopupDialogs(context, message: 'Accept terms and conditions to continue.');
                     return;
                   }
                    model.doSignUp(context);
                  }
                },
                text: 'Sign Up',
                buttonStyle: CustomButtonStyles.fillPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildFullName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full Name'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          onChanged: (String? value){
            _formKey.currentState?.validate();
          },
          controller: model.fullNameController,
          hintText: "Enter full name",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter full name';
            }
            return null;
          },
        )
      ],
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

  Widget _buildLastSection(context) {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: AppColor.kPrimaryColor,
              value: model.acceptTerms,
              onChanged: (value) => model.toggleAcceptTerms(),
            ),
            Text(
              'I accept the terms and privacy policy',
            ),
          ],
        ),
      ],
    );
  }
}
