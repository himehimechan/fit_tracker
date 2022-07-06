import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fit_tracker_eden_farm/config/assets.dart';
import 'package:fit_tracker_eden_farm/config/strings.dart';
import 'package:fit_tracker_eden_farm/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  final AuthController auth;

  const Login(this.auth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              Assets.logo,
              height: 65.h,
              width: 63.w,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Hai',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Fit App Tracker',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 300.h,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                height: 50.h,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Login Dengan',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: ()=> auth.login(),
                          child: Image.asset(
                            Assets.googleIcon,
                            height: 40.h,
                            width: 40.w,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

        ],
      ),
    );
  }
}
