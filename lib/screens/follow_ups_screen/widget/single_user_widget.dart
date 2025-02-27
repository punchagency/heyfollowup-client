import 'package:flutter/material.dart';
import 'package:hey_follow_up/data/models/follow_up_model.dart';
import 'package:hey_follow_up/screens/follow_up_detail/follow_up_detail_screen.dart';
import 'package:hey_follow_up/util/date_helper.dart';
import '../../../util/color_scheme.dart';
import '../../../widget/custom_image_view.dart';

class SingleUserWidget extends StatelessWidget {
  SingleUserWidget(this.followup);

  final FollowUpModel followup;

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: (){
          FollowUpDetailScreen.show(context, followup);
        },
        child: Column(
          children: [
            ClipRect(
              child: CustomImageView(
                radius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
                imagePath: null,
                // imagePath: ImageConstant.avatar1,
              ),
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
                    Text(
                      followup.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
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
                        Text(
                          DateHelper.formatDate(followup.date ?? ''),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
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
                        Text(
                          followup.meetingLocation ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        followup.nextSteps?.firstOrNull ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColor.kPrimaryColor,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
