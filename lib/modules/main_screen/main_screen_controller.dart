import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'main_screen_service.dart';

class MainScreenController extends GetxController {

  final MainScreenService _service;
  var indexButtonNavigation = 0.obs;
  late PageController pageController;

  MainScreenController(this._service);

  @override
  void onInit() {
    super.onInit();
    _init();
  }
  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  Future<void> _init() async {
    pageController = PageController(initialPage: 0);
  }

  void onPageChanged(int page) {
    indexButtonNavigation.value = page;
    if(page == 0) {
      // Get.find<HomeController>().getDataHomePage();
    } else if(page == 1) {
      // Get.find<DipantauController>().getData();
    } else if(page == 2) {
      // Get.find<NotifikasiController>().getData();
    }
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

}