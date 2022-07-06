import 'dart:convert';

import 'package:fit_tracker_eden_farm/config/strings.dart';
import 'package:fit_tracker_eden_farm/models/user.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes.dart';
import 'auth_service.dart';

enum AuthStatus { initial, authenticated, notauthenticated, failed }

class AuthController extends GetxController {
  final AuthService _service;

  AuthController(this._service);
  final _googleSignIn = GoogleSignIn(
    // Optional clientId
    clientId: '39456142374-79bd3plgnj6p275m3eb446laipi6qv29.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _googleSignIn.value.signInSilently();
  }


  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    try {
      logout();
      var googleLogin = await _googleSignIn.value.signIn().then((account) async {
        if(account != null) {
          var checkUser = await _service.getUserProfile(account.id);
          if(checkUser!.docs.isNotEmpty){
            setSharePreferences(account.displayName!, account.email, account.photoUrl!, account.id);
          } else {
            var addUser = _service.addUser(User(id: account.id, name: account.displayName!,
                email: account.email, photoUrl: account.photoUrl))
                .then((value) {
              setSharePreferences(account.displayName!, account.email, account.photoUrl!, account.id);
            })
                .catchError((error)=>print("Failed to add user: $error"));
          }
        }
      });
    } catch (error) {
      print(error);
    }
  }

  Future logout() async {
    try {
      await _googleSignIn.value.signOut();
      await _googleSignIn.value.disconnect();
    } catch (error) {
      print(error);
    }
  }

  Future<void> setSharePreferences(String username, String email, String photoUrl, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Str.sessionUserName, username);
    await prefs.setString(Str.sessionUserEmail, email);
    await prefs.setString(Str.sessionPhotoURL, photoUrl);
    await prefs.setString(Str.sessionIdStr, id);
    Get.offAllNamed(Routes.main_screen);
  }

}