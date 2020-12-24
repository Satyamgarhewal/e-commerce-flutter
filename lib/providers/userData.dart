import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce/utils/stringConstants.dart';
import 'package:e_commerce/utils/localStorageConstants.dart';

class UserData extends ChangeNotifier {
  // List _userData;
  String _userEmail;
  String _uid;
  Future<List> fetchUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    _userEmail = prefs.getString(EMAIL);
    _uid = prefs.getString(TOKEN);
    return [_userEmail, _uid];
  }
}
