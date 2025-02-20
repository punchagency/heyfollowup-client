import 'package:flutter/material.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:shimmer/shimmer.dart';

import 'shimmer_single_user_widget.dart';

class LoadingFollowUpsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Shimmer.fromColors(
      // direction: ShimmerDirection.ltr,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (1 / 1.2),
          crossAxisCount: 2,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerSingleUserWidget();
        },
      ),
      baseColor: Theme.of(context).splashColor,
      highlightColor: Theme.of(context).splashColor.withOpacity(0.5),
    ));
  }
}
