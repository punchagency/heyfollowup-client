import 'package:flutter/material.dart';

import '../util/image_constant.dart';
import 'custom_image_view.dart';

class CustomProfilePicture extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final Color? color;
  final double? width;
  final double? padding;
  final VoidCallback? onTap;

  const CustomProfilePicture(
      {super.key, this.imageUrl, this.height, this.width, this.color, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl!.isEmpty
        ? ClipOval(
            child:
            CustomImageView(
              onTap: () {
                onTap?.call();
              },
              imagePath: ImageConstant.profileIcon,
              height: height ?? 40,
              width: width ?? 40,
              padding: EdgeInsets.all(padding ?? 6),
              fit: BoxFit.cover,
              border: Border.all(
                color: color ?? Colors.white,
                width: 1,
              ),
              radius: BorderRadius.circular(
                50,
              ),
            ),
            // CustomIconButton(
            //         onTap: () {
            //           onTap?.call();
            //         },
            //         height: height ?? 40,
            //         width: width ?? 40,
            //         padding: EdgeInsets.all(6),
            //         decoration: IconButtonStyleHelper.outlineOnPrimary,
            //         alignment: Alignment.center,
            //         child: CustomImageView(
            //           imagePath: ImageConstant.imgLayer1,
            //         ),
            //       ),
          )
        : ClipOval(
            child: CustomImageView(
              onTap: () {
                onTap?.call();
              },
              imagePath: imageUrl,
              height: height ?? 40,
              width: width ?? 40,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(
                50,
              ),
            ),
          );
  }
}
