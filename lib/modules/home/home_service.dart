import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_tracker_eden_farm/models/weight.dart';

import '../../data/network/api.dart';

class HomeService {
  Future<QuerySnapshot?> getWeightData(String id_user) async {
    try {
      var res = Api().getWeightData(id_user);
      return res;
    } catch (e) {
      return null;
    }
  }

  Future<DocumentReference?> addWeight(Weight weight) async {
    try {
      var res = Api().addWeight(weight);
      return res;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> updateWeight(String weight, String date, String id) async {
    try {
      var res = Api().updateWeigth(weight, date, id);
      return res;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> deleteWeight(String id) async {
    try {
      var res = Api().deleteWeigth(id);
      return res;
    } catch (e) {
      return null;
    }
  }
}