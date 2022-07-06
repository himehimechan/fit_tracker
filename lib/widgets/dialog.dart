import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/strings.dart';
import 'custom_alert.dart';

class Dialogs {
  showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlert(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0.h),
              Text(
                Str.appName,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0.sp,
                ),
              ),
              SizedBox(height: 25.0.h),
              Text(
                'Are you sure you want to quit?',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0.sp,
                ),
              ),
              SizedBox(height: 40.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 40.0.h,
                    width: 130.0.h,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Theme.of(context).accentColor),
                        ),
                        backgroundColor: Colors.white
                      ),
                      child: Text(
                        'No',
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(
                    height: 40.0.h,
                    width: 130.0.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPrimary: Colors.black87,
                        primary: Theme.of(context).accentColor,
                      ),
                      child: Text(
                        'Yes',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => exit(0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0.h),
            ],
          ),
        ),
      ),
    );
  }

  showExitDialog1(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: "",
        title: Str.confrimExit,
        onCancelBtnTap: () => Get.back(),
        onConfirmBtnTap: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        }
    );
  }

  showLogOutDialog(BuildContext context, VoidCallback function) {
    showDialog(
      context: context,
      builder: (context) => CustomAlert(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0.h),
              Text(
                Str.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0.sp,
                ),
              ),
              SizedBox(height: 25.0.h),
              Text(
                Str.youSure,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0.sp,
                ),
              ),
              SizedBox(height: 40.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 40.0.h,
                    width: 130.0.w,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        Str.tidakStr,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40.0.h,
                    width: 130.0.w,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        Str.yaStr,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        function;
                        print("logout");
                      },
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0.h),
            ],
          ),
        ),
      ),
    );
  }
}
