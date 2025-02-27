import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/create_follow_up/model/next_step_model.dart';
import 'package:hey_follow_up/screens/create_follow_up/widget/next_step_list_widget.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/date_helper.dart';
import 'package:hey_follow_up/util/styles/custom_button_style.dart';
import 'package:hey_follow_up/widget/custom_dialogs.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:hey_follow_up/widget/custom_image_view.dart';

import '../../widget/custom_phone_number.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/media_picker.dart';
import 'view_model/create_follow_up_vm.dart';

class CreateFollowUpScreen extends StatelessWidget {
  // CreateFollowUpScreen(this.file);

  // final XFile file;

  static Future<void> show(
    BuildContext context,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CreateFollowUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateFollowUpVM>(
      onModelReady: (model){
        model.init();
      },
        builder: (context, model, child) {
      return Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Create A FollowUp',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      CustomDialogs.showCustomModalBottomSheet(
                        context,
                        MediaPicker(
                          onPicked: (files) {
                            if (files.isNotEmpty) {
                              model.addFile(files.first);
                            }
                          },
                          isMultiple: false,
                        ),
                      );
                    },
                    child: model.file == null
                        ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Theme.of(context).dividerColor),
                            ),
                            child: Icon(Icons.image_outlined,
                                size: 30,
                                color: Theme.of(context).dividerColor),
                          )
                        : CustomImageView(
                            // imagePath: ImageConstant.avatarPortrait,
                            imagePath: File(model.file!.path).path,
                            width: 50,
                            height: 50,
                            radius: BorderRadius.circular(10),
                          ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildName(model),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildDate(model, context),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildWhoDidYouMeet(model),
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
                      _buildNextSteps(model, context),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildSchedule(model, context),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildPhoneNumber(model),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        onPressed: (){
                          model.createFollowUp(context);
                        },
                        text: 'Submit',
                        buttonStyle: CustomButtonStyles.fillPrimary,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      );
    });
  }

  _buildName(CreateFollowUpVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          hintText: "Enter name",
          controller: model.fullNameController,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildDate(CreateFollowUpVM model, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date'),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: (){
            model.selectDateTime(context);
          },
          child: CustomTextFormField(
            suffix: Icon(
              Icons.calendar_month_rounded,
              color: AppColor.kPrimaryColor,
            ),
            hintText: model.selectedDate != null ? DateHelper.formatDate(model.selectedDate!) : "Enter date",
            enabled: false,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
          ),
        )
      ],
    );
  }

  _buildWhoDidYouMeet(CreateFollowUpVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Who Did You Meet?'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          hintText: "Name",
          controller: model.metWithController,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildEmail(CreateFollowUpVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          hintText: "enter email",
          controller: model.emailController,
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

  _buildWhereDidYouMeet(CreateFollowUpVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Where did you meet?'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          hintText: "Enter location",
          controller: model.locationController,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  _buildRandomFacts(CreateFollowUpVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Random Facts (Copy and paste their info or socials) *'),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          hintText: "Enter facts",
          controller: model.factsController,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlinePrimaryContainer,
        )
      ],
    );
  }

  Widget _buildLinkedInProfileUrl(CreateFollowUpVM model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('LinkedIn Profile URL'),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: "www.linkedin.com",
                controller: model.linkedInProfileController,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                borderDecoration:
                    TextFormFieldStyleHelper.outlinePrimaryContainer,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.kFormBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                child: Row(
                  children: [
                    Expanded(child: Text('Scan QR Code')),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.qr_code,
                      color: AppColor.kPrimaryColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildNextSteps(CreateFollowUpVM model, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Next Steps?'),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.kFormBorderColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  CustomDialogs.showCustomModalBottomSheet(
                    context,
                    NextStepListWidget<NextStepModel>(
                        onItemSelected: (NextStepModel item) {
                          model.addNextStepItem(item);
                        },
                        list: model.nextSteps),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.kFormBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  child: Row(
                    children: [
                      Expanded(child: Text('Select An Option')),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.kFormBorderColor,
                      )
                    ],
                  ),
                ),
              ),
              if (model.selectedNextSteps.isNotEmpty) ...[
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 2.0,
                  children: model.selectedNextSteps.map((element) {
                    return Chip(
                      side: BorderSide(
                          color: AppColor.kFormBorderColor.withOpacity(0.3),
                          width: 0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onDeleted: () {
                        model.removeNextStepItem(element);
                      },
                      deleteIcon: Icon(
                        Icons.close,
                      ),
                      backgroundColor: element.color,
                      label: Text(
                        element.title,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                )
              ]
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSchedule(CreateFollowUpVM model, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule'),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.kFormBorderColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        model.toggleFollowUp(true);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: model.isFollowUpNow
                                ? Theme.of(context).splashColor
                                : Colors.transparent,
                            border: Border.all(
                              color: AppColor.kFormBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 13),
                        child: Center(child: Text('Follow Up Now')),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        model.toggleFollowUp(false);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: !model.isFollowUpNow
                                ? Theme.of(context).splashColor
                                : Colors.transparent,
                            border: Border.all(
                              color: AppColor.kFormBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 13),
                        child: Center(child: Text('Follow Up Later')),
                      ),
                    ),
                  ),
                ],
              ),
              if (!model.isFollowUpNow) ...[
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    border: Border.all(
                      color: AppColor.kFormBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Select days for follow up'),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  model.selectFollowUpLaterDays(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: model.daysLater == index
                                        ? AppColor.kPrimaryColor
                                        : null,
                                    border: Border.all(
                                      color: model.daysLater == index
                                          ? Colors.transparent
                                          : Theme.of(context).disabledColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    '${index + 1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            color: model.daysLater == index
                                                ? Colors.white
                                                : null),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, int) {
                              return SizedBox(
                                width: 8,
                              );
                            },
                            itemCount: 10),
                      )
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }

  _buildPhoneNumber(CreateFollowUpVM model) {
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
