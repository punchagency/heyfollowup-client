import 'package:flutter/material.dart';
import 'package:hey_follow_up/util/color_scheme.dart';

class CustomDialogs {

  static Future<void> showCustomModalBottomSheet(
    BuildContext context,
    Widget content, {
    double? heightRatio,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<void>(
      isDismissible: isDismissible,
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: isScrollControlled,
      constraints: const BoxConstraints(minWidth: double.infinity),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      barrierColor: barrierColor,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              child: content,
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: InkWell(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                onTap: () => Navigator.pop(context),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 4),
                    child: SizedBox(
                      width: 49,
                      height: 5,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
