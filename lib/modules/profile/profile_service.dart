import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/network/api.dart';

class ProfileService {
  Future<QuerySnapshot?> getUserProfile(String id) async {
    try {
      var res = Api().getUserProfile(id);
      return res;
    } catch (e) {
      return null;
    }
  }
}