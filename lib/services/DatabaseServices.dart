// utils
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});

  final CollectionReference userDetails =
      FirebaseFirestore.instance.collection('users');

  Future updateUserDetails(
      String name, int phone, int dob, String gender) async {
    return await userDetails.doc(uid).set({
      'name': name,
      'phone': phone,
      'dob': dob,
      'gender': gender,
    });
  }
}
