import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/config/config.dart';
import 'package:fit_tracker_eden_farm/modules/auth/auth.dart';
import 'package:fit_tracker_eden_farm/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController(AuthService()));

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: true,
              title: Str.appName,
          theme: appTheme,
          defaultTransition: Transition.fade,
          initialRoute: Routes.root,
          getPages: routes,
        );
        }
    );
  }
}
  