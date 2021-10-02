import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// เพิ่มข้อมูลลง local storage
Future<void> InsertDataToStorage(
    {@required String key, @required String buffer}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, buffer);
}

//อ่านข้อมมูลใน local storage
Future<String> ReadDataInStorage({@required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  final String data = prefs.getString(key);
  return data;
}

//ลบข้อมูลใน local storage
Future<bool> DeleteDataInLocalStorage({@required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  bool status = await prefs.remove(key);
  return status;
}
