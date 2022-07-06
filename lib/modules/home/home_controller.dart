import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:fit_tracker_eden_farm/models/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/home/home.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/strings.dart';

class HomeController extends GetxController {

  final HomeService _service;

  GlobalKey<FormFieldState> inputTxtWeightKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> inputTxtDateKey = GlobalKey<FormFieldState>();
  var inputTxtWeight = TextEditingController().obs;
  var inputTxtDate = TextEditingController().obs;
  var idUser = "";
  var dataWeight = <Weight>[].obs;

  HomeController(this._service);

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idUser = prefs.getString(Str.sessionIdStr)??"";
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    inputTxtDate.value.text = formattedDate;
    getWeigtData();
  }

  addWeight() async {
    CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.loading,
        text: "Loading");
    await _service.addWeight(Weight(id: "${DateTime.now().millisecondsSinceEpoch.toString()}$idUser", id_user: idUser, weight: inputTxtWeight.value.text, date: inputTxtDate.value.text));
    Get.back();
    Get.back();
    getWeigtData();
  }

  getWeigtData() async{
    CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.loading,
        text: "Loading");
    await _service.getWeightData(idUser).then((value) {
      var tempData = <Weight>[];

      for(var data in value?.docs??[]) {
        tempData.add(Weight(id: data.get("id"), id_user: data.get("id_user"), weight: data.get("weight"), date: data.get("date")));
        // dataWeight.add(Weight(id: data.get("id"), id_user: data.get("id_user"), weight: data.get("weight"), date: data.get("date")));
      }
      tempData.sort((a, b) => a.date.compareTo(b.date));
      dataWeight.value = tempData;
      Get.back();
    });
  }

}