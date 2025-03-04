import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/data/models/follow_up_model.dart';
import 'package:hey_follow_up/screens/follow_up_detail/view_model/follow_up_detail_vm.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/date_helper.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:hey_follow_up/widget/custom_image_view.dart';

import '../../util/image_base_64.dart';
import '../../util/styles/custom_button_style.dart';
import '../../widget/custom_text_form_field.dart';

class FollowUpDetailScreen extends StatelessWidget {
  FollowUpDetailScreen(this.followup);

  final FollowUpModel followup;

  static Future<void> show(BuildContext context, FollowUpModel followup) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FollowUpDetailScreen(followup),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FollowUpDetailVM>(onModelReady: (model) {
      model.init(followup);
    }, builder: (context, model, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildTopRow(context, model),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            FutureBuilder(
                                future:
                                    ImageBase64.getBase64Image(followup.image),
                                builder: (context, snapshot) {
                                  var data = snapshot.data;
                                  return data == null
                                      ? CustomImageView(
                                          radius: BorderRadius.circular(20),
                                          width: double.infinity,
                                          height: 300,
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.memory(
                                            filterQuality: FilterQuality.low,
                                            data,
                                            height: 300,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                }),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      AppColor.kPrimaryColor.withOpacity(0.6),
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
                                  followup.name ?? '',
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
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // _buildDay(model),
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
                        const SizedBox(
                          height: 20,
                        ),
                        CustomElevatedButton(
                          onPressed: () {
                            model.update(context, followup);
                          },
                          text: 'Update',
                          buttonStyle: CustomButtonStyles.fillPrimary,
                        )
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

  Widget _buildTopRow(context, FollowUpDetailVM model) {
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
          onPressed: () {
            if (model.isFollowUpNow) {
              model.showHeardBackDialog(context, followup);
              return;
            }
            model.updateFollowUp(context, followup, 'Follow Up Now');
          },
          text: model.isFollowUpNow ? 'Did You Hear Back' : 'Follow Up Now',
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
          controller: model.metWithController,
          hintText: '',
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
          hintText: DateHelper.formatDate(followup.date ?? ''),
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
          controller: model.emailController,
          hintText: '',
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
          controller: model.locationController,
          hintText: '',
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
          controller: model.factsController,
          hintText: '',
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
          controller: model.linkedInProfileController,
          hintText: '',
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
          hintText: followup.nextSteps,
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
          hintText: '',
          controller: model.phoneNumberController,
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
