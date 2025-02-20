import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/follow_ups_screen/widget/loading_follow_ups_shimmer.dart';
import 'package:hey_follow_up/screens/follow_ups_screen/widget/single_user_widget.dart';
import 'package:hey_follow_up/widget/custom_search_bar.dart';

import 'view_model/follow_ups_vm.dart';

class FollowUpsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FollowUpsVm>(
      onModelReady: (p0) => p0.initialize(),
      builder: (context, model, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'FollowUps',
                //         style: Theme.of(context)
                //             .textTheme
                //             .displayLarge
                //             ?.copyWith(fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     Container(
                //       padding:
                //           const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                //       decoration: BoxDecoration(
                //           color: AppColor.kPrimaryColor.withOpacity(0.2),
                //           borderRadius: BorderRadius.circular(10),
                //           border: Border.all(color: AppColor.kPrimaryColor)),
                //       child: SvgPicture.asset(
                //         ImageConstant.profileIcon,
                //         color: AppColor.kPrimaryColor,
                //       ),
                //     ),
                //   ],
                // ),
                CustomSearchBar(
                  onChanged: (String? value) {},
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'FollowUps',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                model.isLoading ? LoadingFollowUpsShimmer() :
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: (1 / 1.6),
                      crossAxisCount: 2,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return SingleUserWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
