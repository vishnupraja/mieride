

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceMie{
  String USER_ID = "USER_ID";
  String LOGIN_KEY = "LOGIN_KEY";


  void setBoolValue(String key, bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  Future<bool?> getBoolValue(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }

  void setStringValue(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  Future<String?> getStringValue(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  void setIntValue(String key, int value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
  }

  Future<int?> getIntValue(String key, int value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(key);
  }

  void setDoubleValue(String key, double value)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setDouble(key, value);
  }

  Future<double?> getDoubleValue(String key)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getDouble(key);

  }

  void clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }

}