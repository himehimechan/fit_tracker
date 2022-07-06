import 'package:cool_alert/cool_alert.dart';
import 'package:fit_tracker_eden_farm/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/profile_update/profile_update.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/strings.dart';

class Profile_updateController extends GetxController {

  final Profile_updateService _service;
  final userName = "".obs;
  final userEmail = "".obs;
  final userProfilePhoto = "".obs;
  final userHeight = "".obs;
  final userDOB = "".obs;
  final userGender = "".obs;
  late var idUser = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> inputTxtNameKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> inputTxtEmailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> inputTxtDobKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> inputTxtHeightKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> inputTxtGenderKey = GlobalKey<FormFieldState>();
  var inputTxtName = TextEditingController().obs;
  var inputTxtEmail = TextEditingController().obs;
  var inputTxtDob = TextEditingController().obs;
  var inputTxtHeight = TextEditingController().obs;
  var inputTxtGender = TextEditingController().obs;

  Profile_updateController(this._service);

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
      inputTxtEmail.value.text = value?.docs[0].get("email");
      inputTxtName.value.text = value?.docs[0].get("name");
      userProfilePhoto.value = value?.docs[0].get("photoUrl");
      inputTxtDob.value.text = value?.docs[0].get("dob");
      inputTxtHeight.value.text = value?.docs[0].get("height");
      inputTxtGender.value.text = value?.docs[0].get("gender");
    })
        .catchError((error)=>print("Failed to get user: $error"));
  }

  updateProfileData() async {
    CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.loading,
        text: "Loading");
    await _service.updateUserProfile(User(id: idUser, name: inputTxtName.value.text,
      email: inputTxtEmail.value.text,photoUrl: userProfilePhoto.value, dob: inputTxtDob.value.text,
    gender: inputTxtGender.value.text, height: inputTxtHeight.value.text), idUser);
    Get.back();
  }

}