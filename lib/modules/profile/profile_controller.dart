import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_tracker_eden_farm/routes/routes.dart';
import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/strings.dart';

class ProfileController extends GetxController {

  final ProfileService _service;
  final userName = "".obs;
  final userEmail = "".obs;
  final userProfilePhoto = "".obs;
  late var idUser = "";

  ProfileController(this._service);

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String checkSession = prefs.getString(Str.sessionIdStr) ?? 'null';
    idUser = prefs.getString(Str.sessionIdStr)??"";
    checkProfileData();
  }

  checkProfileData(){
    _service.getUserProfile(idUser)
        .then((value) {
          userEmail.value = value?.docs[0].get("email");
          userName.value = value?.docs[0].get("name");
          userProfilePhoto.value = value?.docs[0].get("photoUrl");
    })
        .catchError((error)=>print("Failed to get user: $error"));
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear().then((value) {
      _restartApp();
    });
  }

  _restartApp() {
    Get.offAllNamed(Routes.root);
  }
}