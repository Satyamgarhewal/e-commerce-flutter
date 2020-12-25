import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setLocalStorage(String key, value, String type) async {
  final prefs = await SharedPreferences.getInstance();
  if (type == 'String') {
    prefs.setString(key, value);
    return true;
  } else if (type == 'int') {
    prefs.setInt(key, value);
    return true;
  } else if (type == 'bool') {
    prefs.setBool(key, value);
    return true;
  }
  return false;
}

Future<dynamic> getLocalStorage(String key, String type) async {
  dynamic value;
  final prefs = await SharedPreferences.getInstance();
  if (type == 'String') {
    value = prefs.getString(key);
    return value;
  } else if (type == 'int') {
    value = prefs.getInt(key);
    return value;
  } else if (type == 'bool') {
    value = prefs.getBool(key);
    return value;
  }
  return null;
}

Future<void> deleteLocalStorage(key) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}
