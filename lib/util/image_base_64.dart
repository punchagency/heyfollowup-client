import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';


class ImageBase64 {

 static Future<String?> getBase64Image(String? base64String) async {
   try {
     if(base64String == null || base64String.isEmpty){
          return null;
        }
     Uint8List bytes = base64Decode(base64String.split(',').last);
     Directory tempDir = await getTemporaryDirectory();
     String filePath = "${tempDir.path}/image.jpg";

     File file = File(filePath);
     await file.writeAsBytes(bytes);

     return filePath;
   } catch (e) {
     print(e);
     return null;
   }
  }


 static Future<String?> convertImageToBase64(File imageFile) async {
   try {
     List<int> imageBytes = await imageFile.readAsBytes();

     String base64String = base64Encode(imageBytes);

     String mimeType = _getMimeType(imageFile.path);

     return "data:$mimeType;base64,$base64String";
   } catch (e) {
     print(e);
     return null;
   }
 }

// Function to determine MIME type based on file extension
  static String _getMimeType(String filePath) {
    String extension = filePath.split('.').last.toLowerCase();
    switch (extension) {
      case 'png':
        return 'image/png';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'gif':
        return 'image/gif';
      default:
        return 'application/octet-stream'; // Default binary type
    }
  }
}