import 'package:fit_tracker_eden_farm/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/profile_update/profile_update.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/inputField.dart';

class AddWeight extends StatelessWidget {
  final HomeController _controller;

  const AddWeight(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.inputTxtWeight.value.text = "";
    return Scaffold(
      body: Obx(
        () {
          return SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 30.0.h,
                        ),
                        Text(
                          "Berat anda hari ini",
                          style: Get.textTheme.subtitle1,
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Form(
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Berat (Kg)",
                                    style: Get.textTheme.subtitle2,
                                  ),
                                  InputField(
                                    key: _controller.inputTxtWeightKey,
                                    labelText: "Berat (Kg)",
                                    inputType: TextInputType.number,
                                    editingController: _controller.inputTxtWeight.value,
                                    onChange: (String text) {
                                      // print("text : $text");
                                    },
                                    // iconName: Str.usernameIcon,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.0.h,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tanggal",
                                    style: Get.textTheme.subtitle2,
                                  ),
                                  InputField(
                                    isEnable: false,
                                    key: _controller.inputTxtDateKey,
                                    labelText: "Tanggal",
                                    inputType: TextInputType.datetime,
                                    editingController: _controller.inputTxtDate.value,
                                    onChange: (String text) {
                                      // print("text : $text");
                                    },
                                    // iconName: Str.usernameIcon,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.0.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0.h,
                        ),
                        MaterialButton(
                          child: Text("Simpan", style: GoogleFonts.roboto(
                            fontSize: 12.sp, color: Colors.white
                          ),),
                          color: Get.theme.primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            _controller.addWeight();
                          },
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}