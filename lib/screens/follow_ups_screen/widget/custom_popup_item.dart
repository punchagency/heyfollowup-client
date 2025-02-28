import 'package:flutter/material.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
class CustomPopup extends StatelessWidget {
  const CustomPopup(
      {super.key,
      required this.isSelected,
      required this.title, this.color,});

  final bool isSelected;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .titleMedium?.copyWith(
          color: isSelected ? AppColor.kPrimaryColor : null,
        ),
      ),
    );
  }
}
