import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtility {

  static Future<void> spSetString(String key,String value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }
  static Future<void> spSetInt(String key,int value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(key, value);
  }
  static Future<void> spSetDouble(String key,double value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setDouble(key, value);
  }
  static Future<void> spSetBool(String key,bool value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(key, value);
  }
  static Future<void> spSetStringList(String key,List<String> value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(key, value);
  }


  static Future<String?> spGetString(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? valueFromKey =  sharedPreferences.getString(key);
    return valueFromKey;
  }
  static Future<int?> spGetInt(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? valueFromKey =  sharedPreferences.getInt(key);
    return valueFromKey;
  }
  static Future<double?> spGetDouble(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    double? valueFromKey =  sharedPreferences.getDouble(key);
    return valueFromKey;
  }

  static Future<bool?> spGetBool(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? valueFromKey =  sharedPreferences.getBool(key);
    return valueFromKey;
  }

  static Future<List<String>?> spGetStringList(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? valueFromKey =  sharedPreferences.getStringList(key);
    return valueFromKey;
  }

  static Future<void> spDeleteValue(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }
}

