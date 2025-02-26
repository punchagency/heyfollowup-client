import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_follow_up/util/styles/custom_button_style.dart';
import 'package:hey_follow_up/widget/custom_elevated_button.dart';
import 'package:image_picker/image_picker.dart';

class MediaPicker extends StatelessWidget {
  const MediaPicker(
      {super.key,
      required this.onPicked,
      this.onGalleryTap,
      this.isMultiple = true,
      this.isVideo = false});

  final Function(List<XFile> image) onPicked;
  final VoidCallback? onGalleryTap;

  final bool isMultiple;
  final bool isVideo;

  Future<void> _pickCamera(BuildContext context, ImageSource source) async {
    try {
      if (isVideo) {
        final video = await ImagePicker().pickVideo(source: source);
        if (video == null) return;
        onPicked([video]);
        Navigator.of(context).pop();
      } else {
        final image = await ImagePicker().pickImage(
          source: source,
          imageQuality: 25,
        );
        if (image == null) return;
        onPicked([image]);
        Navigator.of(context).pop();
      }
    } on PlatformException {
      print('Something went wrong ');
      Navigator.of(context).pop();
    } catch (e) {
      print('Something went wrong $e');
      Navigator.of(context).pop();
    }
  }

  Future<void> _pickImages(BuildContext context, ImageSource source) async {
    try {
      final image = await ImagePicker().pickMultipleMedia(
        // source: source,
        imageQuality: 25,
      );
      if (image.isEmpty) return;
      onPicked(image);
      Navigator.of(context).pop();
    } on PlatformException {
      print('Something went wrong ');
      Navigator.of(context).pop();
    } catch (e) {
      print('Something went wrong $e');
      Navigator.of(context).pop();
    }
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    try {
      if (isVideo) {
        final video = await ImagePicker().pickVideo(source: source);
        if (video == null) return;
        onPicked([video]);
        Navigator.of(context).pop();
      } else {
        final image = await ImagePicker().pickImage(
          source: source,
          imageQuality: 25,
        );
        if (image == null) return;
        onPicked([image]);
        Navigator.of(context).pop();
      }
      // final image = await ImagePicker().pickMedia(
      //   // source: source,
      //   imageQuality: 25,
      // );
      // if (image == null) return;
      // onPicked([image]);
      //  Navigator.of(context).pop();
    } on PlatformException {
      print('Something went wrong ');
      Navigator.of(context).pop();
    } catch (e) {
      print('Something went wrong $e');
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 21),
        Text(
          'Attachment',
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: 24),
        ListTile(
          onTap: () => _pickCamera(context, ImageSource.camera),
          // onTap: () => isMultiple ? _pickImages(ImageSource.camera) :_pickImage(ImageSource.camera),
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          leading: Icon(Icons.camera),
          title: Text(
            'Camera',
            style: textTheme.bodyMedium,
          ),
        ),
        ListTile(
          onTap: () => onGalleryTap != null
              ? onGalleryTap?.call()
              : isMultiple
                  ? _pickImages(context, ImageSource.gallery)
                  : _pickImage(context, ImageSource.gallery),
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          leading: Icon(Icons.image),
          title: Text(
            'Gallery',
            style: textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 24),
        CustomElevatedButton(
          onPressed: () => Navigator.pop(context),
          text: 'Close',
          buttonStyle: CustomButtonStyles.fillPrimary,
        ),
      ],
    );
  }
}
