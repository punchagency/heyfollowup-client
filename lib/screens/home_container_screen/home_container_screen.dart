import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hey_follow_up/screens/custom_camera/custom_camera_screen.dart';
import 'package:hey_follow_up/screens/home_container_screen/view_model/home_container_vm.dart';
import 'package:hey_follow_up/util/color_scheme.dart';
import 'package:hey_follow_up/util/image_constant.dart';

import '../../core/view_helper/base_view.dart';
import '../create_follow_up/create_follow_up_screen.dart';
import '../follow_ups_screen/follow_ups_screen.dart';
import '../profile_screen/profile_screen.dart';

class HomeContainerScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => HomeContainerScreen(),
      ),
      ((route) => false),
    );
  }

  final List<Widget> screens = [
    FollowUpsScreen(),
    Center(
      child: Container(
        color: AppColor.kAccentColor,
      ),
    ),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeContainerVm>(builder: (context, model, widget) {
      return Scaffold(
        body: screens[model.pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: model.pageIndex,
          selectedItemColor: AppColor.kPrimaryColor,
          unselectedItemColor: AppColor.kGreyColor,
          onTap: (int index) {
            if (index == 1) {
              CreateFollowUpScreen.show(context);
              // CustomCameraScreen.show(context);
              return;
            }
            model.updatePage(index);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset(ImageConstant.home_icon),
              activeIcon: SvgPicture.asset(ImageConstant.home_icon, color: AppColor.kPrimaryColor,),
            ),
            BottomNavigationBarItem(
              label: 'Create FollowUp',
              icon: Container(
                padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColor.kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  ImageConstant.createFollowupIcon,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: SvgPicture.asset(ImageConstant.profileIcon),
              activeIcon: SvgPicture.asset(ImageConstant.profileIcon, color: AppColor.kPrimaryColor,),
            ),
          ],
        ),
      );
    });
  }
}
