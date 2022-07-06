import 'package:fit_tracker_eden_farm/modules/main_screen/main_screen_controller.dart';
import 'package:fit_tracker_eden_farm/modules/main_screen/main_screen_service.dart';
import 'package:get/get.dart';


class MainScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController(MainScreenService()));
  }
}