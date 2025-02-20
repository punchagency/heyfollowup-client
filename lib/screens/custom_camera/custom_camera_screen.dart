import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/core/view_helper/base_view.dart';
import 'package:hey_follow_up/screens/custom_camera/view_model/custom_camera_vm.dart';
import 'package:hey_follow_up/util/color_scheme.dart';

import '../../util/image_constant.dart';
import '../../widget/custom_image_view.dart';

class CustomCameraScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CustomCameraScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CustomCameraVm>(
        onModelReady: (model) => model.initialize(context),
        builder: (context, model, child) {
          return Scaffold(
            body: Stack(
              children: [
                (model.controller == null ||
                        !(model.controller?.value.isInitialized ?? false))
                    ? CustomImageView(
                        imagePath: ImageConstant.avatarPortrait,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : MaterialApp(
                        home: CameraPreview(model.controller!),
                      ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0.0,
                          top: 0.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Card(
                              shape: CircleBorder(),
                              color: AppColor.kWhiteColor.withOpacity(0.7),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.close,
                                  color: AppColor.kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0.0,
                          left: 0.0,
                          bottom: 0.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Opacity(
                                opacity: 0.0,
                                child: Card(
                                  shape: CircleBorder(),
                                  color: AppColor.kWhiteColor.withOpacity(0.7),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.autorenew_rounded,
                                      color: AppColor.kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColor.kWhiteColor,
                                  ),
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () {
                                    model.takePicture(context);
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Card(
                                  shape: CircleBorder(),
                                  color: AppColor.kWhiteColor.withOpacity(0.7),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.autorenew_rounded,
                                      color: AppColor.kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
