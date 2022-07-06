import 'package:get/get.dart';

import 'auth_controller.dart';
import 'auth_service.dart';


class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(AuthService()));
  }
}