import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/profile_update/profile_update.dart';

class Profile_updateBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Profile_updateController(Profile_updateService()));
  }
}