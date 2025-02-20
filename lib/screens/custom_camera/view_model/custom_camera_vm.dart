import 'package:flutter/cupertino.dart';
import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:camera/camera.dart';
import 'package:hey_follow_up/screens/create_follow_up/create_follow_up_screen.dart';

class CustomCameraVm extends BaseModel{

  CameraController? controller;

  late List<CameraDescription> _cameras;


  void initialize(BuildContext context) async {
    _cameras = await availableCameras();
    if(_cameras.isNotEmpty) {
      controller = CameraController(_cameras[0], ResolutionPreset.max);
      controller?.initialize().then((_) {
        if (!context.mounted) {
          return;
        }
        notifyListeners();
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
            // Handle access errors here.
              break;
            default:
            // Handle other errors here.
              break;
          }
        }
      });
    }
  }

  void takePicture(BuildContext context) async {
    CreateFollowUpScreen.show(context);
    // if(controller != null){
    //   XFile file = await controller!.takePicture();
    //   CreateFollowUpScreen.show(context, file);
    // }
  }
}