import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/follow_up_detail/view_model/follow_up_detail_vm.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/image_constant.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:hey_follow_up/widget/custom_image_view.dart';

import '../../util/styles/custom_button_style.dart';
import '../../widget/custom_text_form_field.dart';

class FollowUpDetailScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FollowUpDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FollowUpDetailVM>(builder: (context, model, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildTopRow(context),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CustomImageView(
                              radius: BorderRadius.circular(20),
                              imagePath: ImageConstant.avatar1,
                              width: double.infinity,
                              height: 300,
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.kPrimaryColor.withOpacity(0.6),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                child: Text(
                                  'John Morsan',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          color: AppColor.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildWhoDidYouMeet(model),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildDate(model),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildDay(model),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildEmail(model),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildWhereDidYouMeet(model),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildRandomFacts(model),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildLinkedInProfileUrl(model),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildNextSteps(model),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildPhoneNumber(model),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTopRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColor.kPrimaryColor,
          ),
        ),
        CustomElevatedButton(
          text: 'Did You Hear Back',
          width: 150,
          height: 40,
          buttonStyle: CustomButtonStyles.fillPrimary,
        )
      ],
    );
  }

  _buildWhoDidYouMeet(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Who Did You Meet?'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "Charles Oliveira",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildDate(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "04/02/2025",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildDay(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Day'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "Sat, May 11, 2025",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildEmail(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "charlesrichie@gmail.com",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildWhereDidYouMeet(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Where did you meet?'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "Office",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildRandomFacts(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Random Facts'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "Nothing",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildLinkedInProfileUrl(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('LinkedIn Profile URL'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "www.linkedin.com",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildNextSteps(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Next Steps?'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "Catchup",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildPhoneNumber(FollowUpDetailVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          enabled: false,
          hintText: "(+1) 1122-334-567",
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }
}
