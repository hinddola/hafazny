import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../helper/shared_handeller.dart';

// class SignUpRepo {
//   Future registerRequest(Map<String, dynamic> data) async {
//     try {
//       Response res = await Network.instance!.post(
//           url: 'http://venusdigital.ink:8080/student',
//           withToken: false,
//           body: data);
//       log('res.data: ${res.data}');
//       if (SharedHandler.instance!
//           .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
//           0) {
//         return StudentModel.fromJson(res.data);
//       } else {
//         log('driver repo: ${res.data}');
//         log('driver model: ${TeacherModel.fromJson(res.data)}');
//         return TeacherModel.fromJson(res.data);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//
// }
