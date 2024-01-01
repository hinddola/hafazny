import 'dart:developer';

import '../../../helper/shared_handeller.dart';

class OTPRepo {
  // Future otpRequest(Map<String, dynamic> data) async {
  //   try {
  //     final res = await Network.instance!
  //         .post(url: ApiNames.verifyOTPEndPoint, body: data, withToken: false);
  //     log('res.data: ${res.data}');
  //     if (SharedHandler.instance!
  //         .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
  //         0) {
  //       return StudentModel.fromJson(res.data);
  //     } else {
  //       log('teacher repo: ${res.data}');
  //       log('teacher model: ${TeacherModel.fromJson(res.data)}');
  //       return TeacherModel.fromJson(res.data);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}