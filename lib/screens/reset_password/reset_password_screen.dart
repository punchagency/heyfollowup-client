import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import '../../util/styles/custom_button_style.dart';
import '../../util/validation_functions.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';
import 'view_model/reset_password_vm.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen(this.email, {super.key});

   final String email;

  static Future<void> show(BuildContext context, String email) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ResetPasswordScreen(email),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<ResetPasswordVm>(
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
        child: Container(
          width: double.infinity,
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
                'Enter new password to reset your account password.',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRemainingAuthScreen(
      BuildContext context, ResetPasswordVm model) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildPassword(model),
                const SizedBox(
                  height: 20,
                ),
                _buildConfirmPassword(model),
                const SizedBox(
                  height: 50,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState?.validate() ?? false){
                      model.doResetPassword(context, email);
                    }
                  },
                  text: 'Continue',
                  buttonStyle: CustomButtonStyles.fillPrimary,
                ),
              ],
            ),
          ),
        ),
        // child: _buildTabs(context, model),
      ),
    );
  }

   _buildPassword(ResetPasswordVm model) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('New Password'),
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


   _buildConfirmPassword(ResetPasswordVm model) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('Confirm Password'),
         const SizedBox(
           height: 5,
         ),
         CustomTextFormField(
           controller: model.confirmPasswordController,
           hintText: 'Password',
           onChanged: (String? value){
             _formKey.currentState?.validate();
           },
           textInputAction: TextInputAction.done,
           textInputType: TextInputType.visiblePassword,
           suffix: InkWell(
             onTap: () {
               model.toggleConfirmPasswordVisibility();
             },
             child: Container(
               margin: EdgeInsets.fromLTRB(16, 12, 14, 12),
               child: Icon(
                 model.isShowConfirmPassword ? Icons.visibility : Icons.visibility_off,
                 color: AppColor.kGreyColor,
               ),
             ),
           ),
           suffixConstraints: BoxConstraints(
             maxHeight: 50,
           ),
           obscureText: model.isShowConfirmPassword,
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
             if(model.passwordController.text != value){
               return 'Passwords do not match';
             }
             return null;
           },
         ),
       ],
     );
   }
}
