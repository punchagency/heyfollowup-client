import 'package:flutter/material.dart';
import 'package:hey_follow_up/util/app_theme.dart';
import 'package:hey_follow_up/util/color_scheme.dart';


class CustomTextStyles {
  static TextStyle? get textPrimaryBold =>
      AppTheme.appTheme().textTheme.bodyMedium?.copyWith(
        color: AppColor.kPrimaryColor,
        fontWeight: FontWeight.bold
      );
}
