import 'package:flutter/material.dart';
import 'package:hey_follow_up/screens/follow_up_detail/follow_up_detail_screen.dart';
import '../../../util/color_scheme.dart';

class ShimmerSingleUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 2.0,
      color: AppColor.kGreyColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            width: double.infinity,
            height: 120,
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: AppColor.kPrimaryColor.withOpacity(0.7),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.kGreyColor
                        ),
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColor.kPrimaryColor.withOpacity(0.7),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.kGreyColor
                        ),
                        height: 20,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.kGreyColor
                    ),
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
