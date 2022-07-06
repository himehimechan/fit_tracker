
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_tracker_eden_farm/data/network/api.dart';
import 'package:fit_tracker_eden_farm/models/user.dart';

class AuthService {

  Future<DocumentReference?> addUser(User user) async {
    try {
      var res = Api().addUser(user);
      return res;
    } catch (e) {
      return null;
    }
  }

  Future<QuerySnapshot?> getUserProfile(String id) async {
    try {
      var res = Api().getUserProfile(id);
      return res;
    } catch (e) {
      return null;
    }
  }

}