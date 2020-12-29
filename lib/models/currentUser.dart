import 'package:e_commerce/utils/common.dart';
import 'package:e_commerce/utils/localStorageConstants.dart';
import 'package:e_commerce/utils/stringConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = "error";
    try {
      // ignore: deprecated_member_use
      FirebaseUser _firebaseUser = _auth.currentUser;
      _uid = _firebaseUser.uid;
      _email = _firebaseUser.email;
      setLocalStorage(TOKEN, _uid, STRING);
      setLocalStorage(EMAIL, _email, STRING);
      retVal = "success";
    } catch (err) {
      print(err);
    }
    return retVal;
  }
}
