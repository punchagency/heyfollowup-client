import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  static Future<void> showPopupDialogs(
      BuildContext context, {
        String? message,
        bool isSuccess = false,
        String? title,
        Color color = const Color(0xFF303030),
      }) async {
    await Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarStyle: FlushbarStyle.GROUNDED,
      title: title ?? (isSuccess ? 'Success' : 'Oops 🙊!'),
      message: message ??
          (isSuccess ? 'Request successful ✨' : "Oops 🙊! We've hit a snag."),
      backgroundColor: isSuccess ? Colors.green : color,
      duration: const Duration(seconds: 3),
    ).show(context);
  }



  static Future<void> showLoadingBar(context, {text}) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            contentPadding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            content: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Wrap(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 15.0,
                          ),
                          child: Center(
                            child: SpinKitSquareCircle(
                              color: AppColor.kPrimaryColor,
                              size: 50.0,
                            ),
                          ),
                        ),
                        // Text(text ?? '',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: appTheme.lightGreenA200, fontSize: 14))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
