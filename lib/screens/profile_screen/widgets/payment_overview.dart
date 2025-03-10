import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/styles/custom_button_style.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import '../../../core/injections/locator.dart';
import '../../../services/auth/auth_service.dart';

class PaymentOverview extends StatefulWidget {
  @override
  _PaymentOverview createState() => _PaymentOverview();
}

class _PaymentOverview extends State<PaymentOverview> {
  bool isPayEnabled = false;
  bool isYearly = true;
  final AuthService authService = sl<AuthService>();

  bool _loading = false;
  String? _error;
  bool _success = false;

  Future<void> _handlePayment() async {
    setState(() {
      _loading = true;
      _error = null;
      _success = false;
    });

    try {} catch (err) {
      setState(() {
        _error = err.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.kPrimaryColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Buy Subscriptions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Monthly",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CupertinoSwitch(
              activeTrackColor: AppColor.kPrimaryColor,
                value: isYearly,
                onChanged: (value) {
                  setState(() {
                    isYearly = !isYearly;
                  });
                }),
            const SizedBox(height: 10),
            Text(
              "Yearly",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Card(
          elevation: 6.0,
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isYearly ? '\$49.99' : '\$4.99',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 3.0),
                      child: Text(
                        isYearly ? '/Year' : '/Month',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Annual Subscription",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          text: 'Pay',
          buttonStyle: CustomButtonStyles.fillPrimary,
        ),
        const SizedBox(height: 20),
        //   SizedBox(
        //     width: double.infinity,
        //     child: ElevatedButton(
        //       onPressed: isPayEnabled
        //           ? _loading
        //               ? null
        //               : _handlePayment
        //           : null,
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor:
        //             isPayEnabled ? AppColor.kPrimaryColor : Colors.grey,
        //         padding: EdgeInsets.symmetric(vertical: 16),
        //       ),
        //       child: _loading
        //           ? const CircularProgressIndicator()
        //           : _success
        //               ? const Icon(
        //                   Icons.check,
        //                   color: Colors.white,
        //                 )
        //               : const Text(
        //                   "Pay",
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //     ),
        //   ),
        //   const SizedBox(height: 20),
        //   if (_error != null) ...[
        //     Center(
        //       child: Text(
        //         _error ?? '',
        //         style: TextStyle(color: Colors.red),
        //       ),
        //     ),
        //     const SizedBox(height: 20),
        //   ]
      ],
    );
  }
}
