// packages
import 'package:e_commerce/utils/stringConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/utils/common.dart';
import 'package:e_commerce/utils/localStorageConstants.dart';

Future<dynamic> signUp(String email, String password) async {
  final _auth = FirebaseAuth.instance;
  String token;
  String userEmail;
  bool isNewUser;
  try {
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    token = newUser.user.uid;
    userEmail = newUser.user.email;
    isNewUser = newUser.additionalUserInfo.isNewUser;
    setLocalStorage(TOKEN, token, STRING);
    setLocalStorage(EMAIL, userEmail, STRING);
    setLocalStorage(IS_NEW_USER, isNewUser, BOOL);
    return true;
  } catch (err) {
    return err;
  }
}
