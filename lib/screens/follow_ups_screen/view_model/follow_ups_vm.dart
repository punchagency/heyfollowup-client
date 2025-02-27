import 'package:hey_follow_up/core/view_helper/view_model/base_view_model.dart';
import 'package:hey_follow_up/data/models/follow_up_model.dart';
import 'package:hey_follow_up/services/auth/auth_service.dart';
import '../../../core/injections/locator.dart';
import '../../../data/server/api_client.dart';
import '../../../data/server/endpoints.dart';

class FollowUpsVm extends BaseModel {
  bool isLoading = true;

  final AuthService authService = sl<AuthService>();
  List<FollowUpModel> followups = [];

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();
    final result = await ApiClient.initialiseGetRequest(
      url: EndPoints.followup,
      token: authService.token,
    );
    isLoading = false;
    if (result.isSuccessful) {
      if (result.responseBody != null) {
        followups = (result.responseBody['followUps'] as List)
            .map((element) => FollowUpModel.fromJson(element))
            .toList().reversed.toList();
      }
    }
    notifyListeners();
    // Future.delayed(Duration(seconds: 2,)).whenComplete((){
    //   isLoading = false;
    //   notifyListeners();
    // });
  }
}
