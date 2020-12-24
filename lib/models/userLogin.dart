// packages
import 'package:e_commerce/utils/stringConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/utils/common.dart';
import 'package:e_commerce/utils/localStorageConstants.dart';

Future<bool> signIn(String email, String password) async {
  final _auth = FirebaseAuth.instance;
  String token;
  String userEmail;
  try {
    final newUser = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    token = newUser.user.uid;
    userEmail = newUser.user.email;
    setLocalStorage(TOKEN, token, STRING);
    setLocalStorage(EMAIL, userEmail, STRING);
    return true;
  } catch (err) {
    return false;
  }
}
