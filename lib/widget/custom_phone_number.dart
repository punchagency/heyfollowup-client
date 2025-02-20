import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/services.dart';
import 'package:hey_follow_up/util/color_scheme.dart';

// ignore_for_file: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber(
      {Key? key,
      required this.country,
      required this.onTap,
      required this.controller})
      : super(
          key: key,
        );

  Country country;

  Function(Country country) onTap;

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
            InkWell(
              onTap: (){
                _openCountryPicker(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: CountryPickerUtils.getDefaultFlagImage(
                      country,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text(
                      "+${country.phoneCode}",
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: AppColor.kFormBorderColor,
              thickness: 0.5,
            ),
            Expanded(
              child: TextFormField(
                controller: controller,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                counterText: '',
                hintText: 'phone',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 14,
                ),
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  error: null,

                ),
                maxLength: 10,
                // validator: (String? value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Enter phone number';
                //   }
                //   return null;
                // },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            width: 60,
            child: Text(
              "+${country.phoneCode}",
              style: TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      );

  void _openCountryPicker(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          searchInputDecoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: 14),
          ),
          isSearchable: true,
          title: Text('Select your phone code', style: TextStyle(fontSize: 14)),
          onValuePicked: (Country country) => onTap(country),
          itemBuilder: _buildDialogItem,
        ),
      );
}
