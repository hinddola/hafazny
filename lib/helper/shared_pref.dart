import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferanceHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static dynamic getBool({required String key}) {
    return sharedPreferences!.getBool(key);
  }

  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> removeData(String? key) async {
    return await sharedPreferences!.remove(key!);
  }

  static Future<bool> clearAll() async {
    return await sharedPreferences!.clear();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async
  {
    return await sharedPreferences!.setBool(key, value);
  }
}