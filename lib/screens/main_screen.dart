import 'package:fit_tracker_eden_farm/modules/home/home.dart';
import 'package:fit_tracker_eden_farm/modules/profile/profile.dart';
import 'package:fit_tracker_eden_farm/routes/routes.dart';
import 'package:fit_tracker_eden_farm/screens/home/home.dart';
import 'package:fit_tracker_eden_farm/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/strings.dart';
import '../modules/main_screen/main_screen_controller.dart';
import '../widgets/dialog.dart';

class MainScreen extends StatelessWidget {
  final MainScreenController mainScreen;

  const MainScreen(this.mainScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        return WillPopScope(child: Scaffold(
          body: Stack(
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: mainScreen.pageController,
                onPageChanged: mainScreen.onPageChanged,
                children: <Widget>[
                  HomeScreen(Get.put(HomeController(HomeService()))),
                  Profile(Get.put(ProfileController(ProfileService()))),
                  // Profile(Get.put(ProfileController(ProfileService())))
                ],
              ),
            ],
          ),
          floatingActionButton: Visibility(
            visible: mainScreen.indexButtonNavigation.value == 0 ? true : false,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.home_add_weight);
              },
              child: Text(
                'Tambah Data Berat',
                style: TextStyle(
                  fontSize: 15,
                  color: ThemeData().scaffoldBackgroundColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(10),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: GoogleFonts.roboto(color: Colors.blue),
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                // activeIcon: Image.asset(Assets.homeIconActive, height: 25.h, width: 25.w,),
                label: Str.homeStr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                // activeIcon: Image.asset(Assets.homeIconActive, height: 25.h, width: 25.w,),
                label: Str.profileStr,
              ),
              // BottomNavigationBarItem(
              //   icon: const Icon(Icons.person),
              //   // activeIcon: Image.asset(Assets.homeIconActive, height: 25.h, width: 25.w,),
              //   label: Str.profileStr,
              // ),
            ],
            currentIndex: mainScreen.indexButtonNavigation.value,
            showUnselectedLabels: true,
            elevation: 20,
            onTap: (index) {
              print("debug: $index");
              mainScreen.navigationTapped(index);
            },
          ),
        ), onWillPop: () =>
            Dialogs().showExitDialog1(context)
        );
      },
    );
  }

}