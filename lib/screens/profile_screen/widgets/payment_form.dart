import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_follow_up/util/color_scheme.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool isPayEnabled = false;

  void _validateForm() {
    print('Card Number:: ${_cardNumberController.text.replaceAll(' ', '').length}, Exp. Date:: ${_expiryController.text.length}, CVV:: ${_cvvController.text.length}');

    setState(() {
      isPayEnabled = _cardNumberController.text.length == 16 &&
          _expiryController.text.length == 4 &&
          _cvvController.text.length == 3;
    });
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
              icon: Icon(Icons.arrow_back, color: AppColor.kPrimaryColor,),
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
        Text("16 Digits Number"),
        TextField(
          controller: _cardNumberController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
            CardNumberInputFormatter(),
          ],
          decoration: InputDecoration(
            hintText: "1234 5678 9012 1234",
            suffixIcon: Icon(Icons.credit_card),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onChanged: (_) => _validateForm(),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expiration date"),
                  TextField(
                    controller: _expiryController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ExpiryDateInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      hintText: "MM / YY",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onChanged: (_) => _validateForm(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CVV / CVC"),
                  TextField(
                    controller: _cvvController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "***",
                      suffixIcon: Icon(Icons.help_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onChanged: (_) => _validateForm(),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text("Save this payment method"),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isPayEnabled ? () {} : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isPayEnabled ? Colors.blue : Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text("Pay", style: TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(height: 20),
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
