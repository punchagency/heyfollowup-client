
import 'package:injectable/injectable.dart';

import '../../../core/view_helper/view_model/base_view_model.dart';

@lazySingleton
class HomeContainerVm extends BaseModel{

  int pageIndex = 0;

  updatePage(int pageIndex){
    this.pageIndex = pageIndex;
    notifyListeners();
  }

}