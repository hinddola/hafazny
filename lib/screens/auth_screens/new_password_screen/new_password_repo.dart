// import 'dart:developer';
//
// import 'package:get/get_connect/http/src/response/response.dart';
//
// import '../../../model/new_password_model.dart';
//
// class NewPasswordRepo {
//   Future newPasswordRequest(Map<String, dynamic> data) async {
//     try {
//       final res = await Network.instance!.patch(
//           url:'http://localhost:8080/student/resetPassword' /* SharedHandler.instance!.getData(
//                       key: SharedKeys().userType, valueType: ValueType.int) ==
//                   0
//               ? ApiNames.studentResetPasswordEndPoint
//               : ApiNames.teacherResetPasswordEndPoint */,
//           body: data,
//           withToken: false);
//       log('res.data: ${res.data}');
//       return NewPasswordModel.fromJson(res.data);
//       /* if (SharedHandler.instance!
//               .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
//           0) {
//         return StudentModel.fromJson(res.data);
//       } else {
//         log('teacher repo: ${res.data}');
//         log('teacher model: ${TeacherModel.fromJson(res.data)}');
//         return TeacherModel.fromJson(res.data);
//       } */
//     } catch (e) {
//       rethrow;
//     }
//   }
// }