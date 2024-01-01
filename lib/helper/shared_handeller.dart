// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedKeys {
//   String isLogin = "IS_LOGIN";
//
//   String student = "STUDENT";
//   String token = "TOKEN";
//   String rememberMe = "REMEMBER_ME";
//   String lang = "LANG";
//   String theme = "THEME";
//   String isNotFirstTime = "Is_NOT_FIRST_TIME";
//   String teacher = 'TEACHER';
//   String userType = "USER_TYPE";
//   String teacherAge = "TEACHER_AGE";
// }
//
// enum ValueType { int, string, bool, double, map }
//
// class SharedHandler {
//   static SharedHandler? instance;
//   late final SharedPreferences _sharedPreferences;
//   //بخليه برايفت عشان مقدرش اعمل اوبجكت من الكلاس دا من برا
//   SharedHandler._internal();
//   // بعمل اوبجكت من الكلاس دا من جوا الكلاس من خلال اني بدي البرايفت كونستراكتور للانستانس اللي اتعمل فوق دا
//   // وبرن الميثود كلها فالمين بالتالي هيكريت الاوبجكت اول ما بستخدم الابلكيشن ومش هيتكريت اي اوبجكت غير اللي عملته
//   static init() async {
//     if (instance == null) {
//       instance = SharedHandler._internal();
//       instance!._sharedPreferences = await SharedPreferences.getInstance();
//     }
//   }
//
//   Future<void> setData(String key, {dynamic value}) async {
//     if (value is String) {
//       _sharedPreferences.setString(key, value);
//     } else if (value is bool) {
//       _sharedPreferences.setBool(key, value);
//     } else if (value is int) {
//       _sharedPreferences.setInt(key, value);
//     } else if (value is double) {
//       _sharedPreferences.setDouble(key, value);
//     } else if (value is Map) {
//       String json = jsonEncode(value);
//       _sharedPreferences.setString(key, json);
//     } else {
//       throw TypeError();
//     }
//   }
//
//   dynamic getData({required String key, required ValueType valueType}) {
//     switch (valueType) {
//       case ValueType.string:
//         return _sharedPreferences.getString(key) ?? "";
//       case ValueType.int:
//         return _sharedPreferences.getInt(key) ?? 0;
//       case ValueType.double:
//         return _sharedPreferences.getDouble(key) ?? 0.0;
//       case ValueType.bool:
//         return _sharedPreferences.getBool(key) ?? false;
//       case ValueType.map:
//         String? value = _sharedPreferences.getString(key);
//         Map<String, dynamic> data = value != null ? jsonDecode(value) : {};
//         return data;
//       default:
//         return "";
//     }
//   }
//
//   void clear({required List<String> keys}) {
//     for (String key in keys) {
//       _sharedPreferences.remove(key);
//     }
//   }
// }
//
// //SharedHandler.instance!.getData(key: SharedKeys().user , valueType: ValueType.map)
