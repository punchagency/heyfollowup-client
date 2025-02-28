import 'package:flutter/material.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/image_constant.dart';
import 'package:hey_follow_up/widget/custom_image_view.dart';

// ignore_for_file: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({Key? key, required this.onChanged, this.controller, this.onShowPopupMenu})
      : super(
          key: key,
        );

  Function(String value) onChanged;

  Function(TapDownDetails details)? onShowPopupMenu;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(width: 1, color: AppColor.kFormBorderColor),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: onChanged,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomImageView(
                      imagePath: ImageConstant.searchIcon,
                    ),
                  ),
                  counterText: '',
                  hintText: 'search contact',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 14,
                  ),
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  error: null,
                ),
                maxLength: 10,
              ),
            ),
            VerticalDivider(
              indent: 10.0,
              endIndent: 10.0,
              color: AppColor.kFormBorderColor,
              thickness: 0.5,
            ),
            GestureDetector(
              onTapDown: onShowPopupMenu,
              child: CustomImageView(
                imagePath: ImageConstant.filerIcon,
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
