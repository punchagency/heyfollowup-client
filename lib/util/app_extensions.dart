
import '../widget/custom_image_view.dart';

extension CustomStringExtension on String {
  String toTitleCase() => this.isEmpty
      ? this
      : this
          .replaceAllMapped(
              RegExp(r'[A-Z]'),
              (match) =>
                  ' ${match.group(0)}') // Add space before uppercase letters
          .trim() // Remove leading/trailing spaces
          .replaceFirst(this[0], this[0].toUpperCase());
}


extension MediaTypeExtension on String {
  String get resourceType {
    if (this.endsWith('.mp3') || this.endsWith('.mp4')) {
      return 'video';
    } else {
      return 'image';
    }
  }
}


extension ImageTypeExtension on String {
  ImageType get imageType {
    if (this.startsWith('http') || this.startsWith('https')) {
      return ImageType.network;
    } else if (this.endsWith('.svg')) {
      return ImageType.svg;
    } else if (this.startsWith('file://') || this.contains('/com.heyfollowup.app')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}