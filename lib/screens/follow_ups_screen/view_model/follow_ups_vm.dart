import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';

class FollowUpsVm extends BaseModel{

  bool isLoading = true;

  void initialize(){
    Future.delayed(Duration(seconds: 2,)).whenComplete((){
      isLoading = false;
      notifyListeners();
    });
  }
}