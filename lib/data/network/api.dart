import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_tracker_eden_farm/models/user.dart';
import 'package:fit_tracker_eden_farm/models/weight.dart';
import 'package:http/http.dart' as http;

part 'api_constant.dart';
part 'api_exception.dart';
part 'api_handler.dart';

class Api {
  static final ApiHandler _handler = ApiHandler();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<DocumentReference> addUser(User user) async {
    return await users.add(user.toJson());
  }

  Future<QuerySnapshot> getUserProfile(String id) async {
    return await users.where("id", isEqualTo: id).limit(1).get();
  }

  Future<bool> updateUser(User user, String id) async {
    var update = await users.where("id", isEqualTo: id).limit(1).get().then((QuerySnapshot snapshot) {
      var batch = FirebaseFirestore.instance.batch();
      //Updates the field value, using post as document reference
      batch.update(snapshot.docs[0].reference, user.toJson());
      batch.commit();
    });
    return true;
  }

  CollectionReference weightCollection = FirebaseFirestore.instance.collection('weight');

  Future<DocumentReference> addWeight(Weight weight) async {
    return await weightCollection.add(weight.toJson());
  }

  Future<QuerySnapshot> getWeightData(String id_user) async {
    return await weightCollection.where("id_user", isEqualTo: id_user).get();
  }

  Future<bool> updateWeigth(String weight, String date, String id) async {
    var update = await users.where("id", isEqualTo: id).limit(1).get().then((QuerySnapshot snapshot) {
      var batch = FirebaseFirestore.instance.batch();
      //Updates the field value, using post as document reference
      batch.update(snapshot.docs[0].reference, {"weight":weight, "date":date});
      batch.commit();
    });
    return true;
  }

  Future<bool> deleteWeigth(String id) async {
    var update = await users.where("id", isEqualTo: id).limit(1).get().then((QuerySnapshot snapshot) {
      var batch = FirebaseFirestore.instance.batch();
      batch.delete(snapshot.docs[0].reference);
      batch.commit();
    });
    return true;
  }

}