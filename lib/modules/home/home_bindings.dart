import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/home/home.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(HomeService()));
  }
}