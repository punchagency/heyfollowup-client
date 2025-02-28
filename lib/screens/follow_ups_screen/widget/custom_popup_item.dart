import 'package:flutter/material.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
class CustomPopup extends StatelessWidget {
  const CustomPopup(
      {super.key,
      required this.isSelected,
      required this.title,});

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .titleMedium?.copyWith(
        color: isSelected ? AppColor.kPrimaryColor : null,
      ),
    );
  }
}
