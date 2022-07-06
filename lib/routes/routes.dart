import 'package:fit_tracker_eden_farm/modules/auth/auth_bindings.dart';
import 'package:fit_tracker_eden_farm/modules/home/home.dart';
import 'package:fit_tracker_eden_farm/modules/main_screen/main_screen.dart';
import 'package:fit_tracker_eden_farm/modules/profile_update/profile_update.dart';
import 'package:fit_tracker_eden_farm/screens/home/add_weight.dart';
import 'package:fit_tracker_eden_farm/screens/main_screen.dart';
import 'package:fit_tracker_eden_farm/screens/profile.dart';
import 'package:fit_tracker_eden_farm/screens/profile_update.dart';
import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/screens/login.dart';
import 'package:fit_tracker_eden_farm/screens/splash.dart';

class Routes {
  static const String root = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String home_add_weight = '/home/add_weight';
  static const String main_screen = '/main_screen';
  static const String profile_screen = '/profile_screen';
  static const String profile_update = '/profile_screen/profile_update';
}

final List<GetPage> routes = [
  GetPage(name: Routes.root, page: () => const Splash()),
  GetPage(name: Routes.login, page: () => Login(Get.find()), binding: AuthBindings()),
  GetPage(name: Routes.home, page: () => Login(Get.find())),
  GetPage(name: Routes.home_add_weight, page: () => AddWeight(Get.find())),
  GetPage(name: Routes.profile_screen, page: () => Profile(Get.find())),
  GetPage(name: Routes.profile_update, page: () => Profile_update(Get.find()), binding: Profile_updateBindings()),
  GetPage(name: Routes.main_screen, page: () => MainScreen(Get.find()), binding: MainScreenBindings()),
];