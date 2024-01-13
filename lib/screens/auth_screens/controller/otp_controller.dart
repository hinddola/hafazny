import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_validation.dart';

import 'forget_password_controller.dart';

class OTPController extends GetxController with Validations{

  final GlobalKey<FormState> oTPFormKey = GlobalKey<FormState>();

  final authController = AuthController();
  final forgetPasswordController = ForgetPasswordController();

  TextEditingController codeController1 = TextEditingController();
  String codeError1 = '';
  TextEditingController codeController2 = TextEditingController();
  String codeError2 = '';
  TextEditingController codeController3 = TextEditingController();
  String codeError3 = '';
  TextEditingController codeController4 = TextEditingController();
  String codeError4 = '';

  //StudentModel studentModel = StudentModel();
  //TeacherModel teacherModel = TeacherModel();


  // verifyCode() async {
  //   try {
  //     Map<String, dynamic> data = {
  //       'phoneNumber': forgetPasswordController.value.isNotEmpty
  //           ? forgetPasswordController.phoneController.text
  //           : authController.phoneNumberController.text.isNotEmpty
  //           ? authController.phoneNumberController.text
  //           : authController.phoneNumberController.text,
  //       'code': int.parse([
  //         codeController1.text,
  //         codeController2.text,
  //         codeController3.text,
  //         codeController4.text,
  //       ].join()),
  //       /*  'type': SharedHandler.instance!
  //           .getData(key: SharedKeys().userType, valueType: ValueType.int) */
  //     };
  //     log('data :${data.toString()}');
  //     if (SharedHandler.instance!
  //         .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
  //         0) {
  //       studentModel = await _otpRepo.otpRequest(data);
  //
  //       SharedHandler.instance!
  //           .setData(SharedKeys().student, value: studentModel.toJson());
  //       SharedHandler.instance!
  //           .setData(SharedKeys().token, value: studentModel.token);
  //       log('student otp token: ${studentModel.token}');
  //       log('studentModel otp: ${studentModel.toString()}');
  //     } else {
  //       log('data to repo : ${data.toString()}');
  //       teacherModel = await _otpRepo.otpRequest(data);
  //       SharedHandler.instance!
  //           .setData(SharedKeys().teacher, value: teacherModel.toJson());
  //       SharedHandler.instance!
  //           .setData(SharedKeys().token, value: teacherModel.token);
  //       log('teacher otp token: ${teacherModel.token}');
  //       log('teacherModel register: ${teacherModel.toString()}');
  //     }
  //     log('success');
  //
  //     log('verified');
  //     log('isForgetPassword : ${authController.isForgetPassword}');
  //     if (authController.isForgetPassword == false) {
  //       await SharedHandler.instance!
  //           .setData(SharedKeys().isLogin, value: true);
  //       /* log('user model token: ${.authToken}');
  //       log('driver model token: ${teacherModel.authToken}'); */
  //       await SharedHandler.instance!
  //           .setData(SharedKeys().isNotFirstTime, value: true);
  //     }
  //
  //     if (authController.isForgetPassword) {
  //       //AppRoutes.pushNamedNavigator(routeName: Routes.newPassword);
  //     } else {
  //       if (SharedHandler.instance!.getData(
  //           key: SharedKeys().userType, valueType: ValueType.int) ==
  //           0) {
  //         if (studentModel.data!.isVerified == true) {
  //           // AppRoutes.pushNamedNavigator(
  //           //     routeName: Routes.navBar, replacementAll: true);
  //         }
  //         else{
  //           // AppRoutes.pushNamedNavigator(
  //           //     routeName: Routes.studentData, replacementAll: true);
  //         }
  //       }
  //       authController.clearSignUpData();
  //     }
  //
  //     //emit(OTPLoaded());
  //   } catch (e) {
  //     log('verify code error :${e.toString()}');
  //     //emit(OTPError());
  //   }
  // }
}

