import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/follow_ups_screen/widget/loading_follow_ups_shimmer.dart';
import 'package:hey_follow_up/screens/follow_ups_screen/widget/single_user_widget.dart';
import 'package:hey_follow_up/util/image_constant.dart';
import 'package:hey_follow_up/widget/custom_search_bar.dart';

import '../../widget/custom_image_view.dart';
import '../follow_up_detail/follow_up_detail_screen.dart';
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
                  CustomSearchBar(
                    onChanged: (String? value) {
                      model.searchItem(value);
                    },
                    onShowPopupMenu: (details) {
                      model.showPopupMenu(context, details.globalPosition);
                    },
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
                  model.isLoading
                      ? LoadingFollowUpsShimmer()
                      : model.followups.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomImageView(
                                  width: double.infinity,
                                  // height: 120,
                                  fit: BoxFit.cover,
                                  imagePath: ImageConstant.notFollowingImage,
                                  // imagePath: ImageConstant.avatar1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    'You haven\'t followed anyone yet. Start connecting!',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    model.initialize();
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                  ),
                                )
                              ],
                            )
                          : Expanded(
                              child: RefreshIndicator(
                                onRefresh: model.initialize,
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: (1 / 1.6),
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: model.followups.length,
                                  itemBuilder: (context, index) {
                                    return SingleUserWidget(
                                      model.followups[index],
                                      (followup) async {
                                        await FollowUpDetailScreen.show(context, followup);
                                        model.fetchFollowups();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                ],
              ),
            ),
          );
        });
  }
}
