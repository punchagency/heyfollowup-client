import 'dart:convert';
import 'package:hey_follow_up/screens/profile_screen/widgets/card_details_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hey_follow_up/util/color_scheme.dart';

import '../../../core/injections/locator.dart';
import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';
import '../../../services/auth/auth_service.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  bool isPayEnabled = false;
  bool saveCard = false;
  final AuthService authService = sl<AuthService>();

  void _validateForm(bool cardNumber, bool expDate, bool cvv) {
    setState(() {
      isPayEnabled = cardNumber && expDate && cvv;
    });
  }

  bool _loading = false;
  String? _error;
  bool _success = false;

  Future<void> _handlePayment() async {
    setState(() {
      _loading = true;
      _error = null;
      _success = false;
    });

    try {
      // Create Payment Method
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(
              name: authService.user?.fullName ?? '',
              email: authService.user?.email ?? '',
            ),
          ),
        ),
      );

      final paymentMethodId = paymentMethod.id;
      print("Payment Method ID: $paymentMethodId");

      print('card details::: ${paymentMethod.card.toJson()}');

      final result = await ApiClient.initialisePostRequest(
          url: EndPoints.processPayment,
          data: {
            "paymentMethodId": paymentMethodId,
            "saveCard": saveCard,
          },
          token: authService.token,
      );
      if (result.isSuccessful) {
        if (result.responseBody != null) {
          setState(() {
            _success = true;
          });
          Future.delayed(const Duration(seconds: 3)).whenComplete(() {
            Navigator.of(context).pop();
            CardDetailsScreen.show(context, paymentMethod);
          });
        }
      } else {
        throw Exception(result.responseBody ?? "Payment failed");
      }
    } catch (err) {
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
          'Add new payment method',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        CardField(
          onCardChanged: (details) {
            _validateForm(
                details?.validExpiryDate == CardValidationState.Valid,
                details?.validExpiryDate == CardValidationState.Valid,
                details?.validCVC == CardValidationState.Valid);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Card Details",
          ),
        ),
        // Text("16 Digits Number"),
        // TextField(
        //   controller: _cardNumberController,
        //   keyboardType: TextInputType.number,
        //   inputFormatters: [
        //     FilteringTextInputFormatter.digitsOnly,
        //     LengthLimitingTextInputFormatter(16),
        //     CardNumberInputFormatter(),
        //   ],
        //   decoration: InputDecoration(
        //     hintText: "1234 5678 9012 1234",
        //     suffixIcon: Icon(Icons.credit_card),
        //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //   ),
        //   onChanged: (_) => _validateForm(),
        // ),
        // const SizedBox(height: 20),
        // Row(
        //   children: [
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text("Expiration date"),
        //           TextField(
        //             controller: _expiryController,
        //             keyboardType: TextInputType.number,
        //             inputFormatters: [
        //               FilteringTextInputFormatter.digitsOnly,
        //               LengthLimitingTextInputFormatter(4),
        //               ExpiryDateInputFormatter(),
        //             ],
        //             decoration: InputDecoration(
        //               hintText: "MM / YY",
        //               border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(8)),
        //             ),
        //             onChanged: (_) => _validateForm(),
        //           ),
        //         ],
        //       ),
        //     ),
        //     const SizedBox(width: 20),
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text("CVV / CVC"),
        //           TextField(
        //             controller: _cvvController,
        //             keyboardType: TextInputType.number,
        //             inputFormatters: [
        //               FilteringTextInputFormatter.digitsOnly,
        //               LengthLimitingTextInputFormatter(3),
        //             ],
        //             obscureText: true,
        //             decoration: InputDecoration(
        //               hintText: "***",
        //               suffixIcon: Icon(Icons.help_outline),
        //               border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(8)),
        //             ),
        //             onChanged: (_) => _validateForm(),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 20),
        Row(
          children: [
            Checkbox(
                value: saveCard,
                onChanged: (value) {
                  setState(() {
                    saveCard = !saveCard;
                  });
                }),
            Text("Save this payment method"),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isPayEnabled
                ? _loading
                    ? null
                    : _handlePayment
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isPayEnabled ? AppColor.kPrimaryColor : Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: _loading
                ? const CircularProgressIndicator()
                : _success
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : const Text(
                        "Pay",
                        style: TextStyle(color: Colors.white),
                      ),
          ),
        ),
        const SizedBox(height: 20),
        if (_error != null) ...[
          Center(
            child: Text(
              _error ?? '',
              style: TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20),
        ]
      ],
    );
  }
}

// Formatter for Credit Card Number (adds spaces after every 4 digits)
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formattedText = '';

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) formattedText += ' ';
      formattedText += text[i];
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

// Formatter for Expiry Date (MM/YY)
class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formattedText = '';

    if (text.length > 2) {
      formattedText = '${text.substring(0, 2)} / ${text.substring(2)}';
    } else {
      formattedText = text;
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
