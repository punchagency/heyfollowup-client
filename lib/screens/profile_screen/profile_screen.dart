import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/get_started/get_started_screen.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:hey_follow_up/widget/custom_profile_picture.dart';
import '../../util/color_scheme.dart';
import '../../util/image_constant.dart';
import '../../util/validation_functions.dart';
import '../../widget/custom_phone_number.dart';
import '../../widget/custom_text_form_field.dart';
import 'view_model/profile_screen_vm.dart';
import 'widgets/payment_form.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileScreenVM>(onModelReady: (model) {
      model.onInit(context);
    }, builder: (context, model, child) {
      return Scaffold(
          body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // leading: IconButton(
              //   onPressed: () {},
              //   icon: Icon(
              //     Icons.arrow_back,
              //     color: Colors.white,
              //   ),
              // ),
              actions: [
                InkWell(
                  onTap: () {
                    GetStartedScreen.show(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColor.kWhiteColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      ImageConstant.logoutIcon,
                      color: AppColor.kWhiteColor,
                    ),
                  ),
                ),
              ],
              expandedHeight: 250.0,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      color: AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomProfilePicture(
                          // imageUrl: ImageConstant.avatar1,
                          padding: 20.0,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          model.authService.user?.fullName ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Details',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildFullName(model),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildEmail(model),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // _buildPhoneNumber(model),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // _buildSubscription(context),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              bool confirmDelete = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Delete Account"),
                                  content: Text(
                                      "Are you sure you want to delete your account? This action is irreversible."),
                                  actions: [
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text("Cancel")),
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: Text("Delete")),
                                  ],
                                ),
                              );

                              if (confirmDelete) {
                                model.deleteAccount(context);
                              }
                            },
                            child: Text(
                              "Delete Account",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                          ),
                        ),
                        // _buildPassword(model, context),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ));
    });
  }

  _buildFullName(ProfileScreenVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full Name'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          onChanged: (String? value) {
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

  _buildEmail(ProfileScreenVM model) {
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

  _buildPhoneNumber(ProfileScreenVM model) {
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

  _buildPassword(ProfileScreenVM model, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {},
            child: Text(
              'Change Password',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Text('Password'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          controller: model.passwordController,
          hintText: 'Password',
          onChanged: (String? value) {
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

  _buildSubscription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Subscription'),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () {
            _showPaymentModal(context);
          },
          child: CustomTextFormField(
            enabled: false,
            hintText: 'Subscribe',
            textInputType: TextInputType.emailAddress,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              // vertical: 14,
            ),
            suffix: Container(
              decoration: BoxDecoration(
                color: AppColor.kPrimaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text(
                  "Subscribe",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              height: 40,
              width: 150,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
          ),
        )
      ],
    );
  }

  void _showPaymentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: PaymentForm(),
        );
      },
    );
  }
}
