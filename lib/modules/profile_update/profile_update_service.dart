import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/network/api.dart';
import '../../models/user.dart';

class Profile_updateService {
  Future<QuerySnapshot?> getUserProfile(String id) async {
    try {
      var res = Api().getUserProfile(id);
      return res;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> updateUserProfile(User user, String id) async {
    try {
      var res = Api().updateUser(user, id);
      return res;
    } catch (e) {
      return null;
    }
  }

}