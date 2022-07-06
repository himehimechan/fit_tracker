import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/profile/profile.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(ProfileService()));
  }
}