import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/profile_update/profile_update.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/inputField.dart';

class Profile_update extends StatelessWidget {
  final Profile_updateController _controller;

  const Profile_update(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          "Personal Information",
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
                                    "Nama",
                                    style: Get.textTheme.subtitle2,
                                  ),
                                  InputField(
                                    key: _controller.inputTxtNameKey,
                                    labelText: "Nama",
                                    inputType: TextInputType.text,
                                    editingController: _controller.inputTxtName.value,
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
                                    "Email",
                                    style: Get.textTheme.subtitle2,
                                  ),
                                  InputField(
                                    key: _controller.inputTxtEmailKey,
                                    labelText: "Nama",
                                    inputType: TextInputType.emailAddress,
                                    editingController: _controller.inputTxtEmail.value,
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
                                    "Jenis Kelamin",
                                    style: Get.textTheme.subtitle2,
                                  ),
                                  InputField(
                                    key: _controller.inputTxtGenderKey,
                                    labelText: "Jenis Kelamin",
                                    inputType: TextInputType.text,
                                    editingController: _controller.inputTxtGender.value,
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
                                    "Tanggal Lahir",
                                    style: Get.textTheme.subtitle2,
                                  ),
                                  InputField(
                                    key: _controller.inputTxtDobKey,
                                    labelText: "Tanggal Lahir",
                                    inputType: TextInputType.datetime,
                                    editingController: _controller.inputTxtDob.value,
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
                                    "Tinggi",
                                    style: Get.textTheme.subtitle2,
                                  ),
                                  InputField(
                                    key: _controller.inputTxtHeightKey,
                                    labelText: "Tinggi",
                                    inputType: TextInputType.number,
                                    editingController: _controller.inputTxtHeight.value,
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
                            _controller.updateProfileData();
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