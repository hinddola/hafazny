import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../forget_password_screen/forget_password_repo.dart';

class ForgetPasswordController extends GetxController{

  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String value = '';
  //final ForgetPasswordRepo _forgetPasswordRepo = ForgetPasswordRepo();

  // StudentModel studentModel = StudentModel();
  // TeacherModel teacherModel = TeacherModel();

  forgetPassword() async {
    //emit(ForgetPasswordLoading());
    try {
      Map<String, dynamic> data = {
        'phoneNumber': phoneController.text,
        //'type': type,
      };
      log(data.toString());
     // value= await _forgetPasswordRepo.forgetPasswordRequest(data);
      log('value of repo:$value');
      //log('data to repo : ${_forgetPasswordRepo.forgetPasswordRequest(data).then((value) => log("value :${value.toString()}"))}');
      //AppRoutes.pushNamedNavigator(routeName: Routes.otpScreen);
      /*   if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) {
        studentModel = await _forgetPasswordRepo.forgetPasswordRequest(data);

        SharedHandler.instance!
            .setData(SharedKeys().student, value: studentModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: studentModel.token);
        log('student otp token: ${studentModel.token}');
        log('studentModel otp: ${studentModel.toString()}');
      } else {
        log('data to repo : ${data.toString()}');
        teacherModel = await _forgetPasswordRepo.forgetPasswordRequest(data);
        SharedHandler.instance!
            .setData(SharedKeys().teacher, value: teacherModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: teacherModel.token);
        log('teacher otp token: ${teacherModel.token}');
        log('teacherModel register: ${teacherModel.toString()}');
      } */

      //emit(ForgetPasswordLoaded());
    } catch (e) {
      log('forget password error :${e.toString()}');
      //emit(ForgetPasswordError());
    }
  }
}
