import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_validation.dart';
import 'package:hafazny/screens/auth_screens/controller/forget_password_controller.dart';
import 'package:hafazny/screens/auth_screens/controller/otp_controller.dart';

import '../../../helper/shared_handeller.dart';
import '../new_password_screen/new_password_repo.dart';

class NewPasswordController extends GetxController with Validations{

  final GlobalKey<FormState> newPasswordformKey = GlobalKey<FormState>();

  final oTPController = OTPController();
  final forgetPasswordController = ForgetPasswordController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //NewPasswordModel newPasswordModel = NewPasswordModel();
  //NewPasswordRepo newPasswordRepo = NewPasswordRepo();

  newPassword() async {
    //emit(NewPasswordLoading());
    try {
      /* if (_resetPasswordValidation()) { */
      Map<String, dynamic> data = {
        'phoneNumber': forgetPasswordController.phoneController.text,
        'code': int.parse([
          oTPController.codeController1.text,
          oTPController.codeController2.text,
          oTPController.codeController3.text,
          oTPController.codeController4.text,
        ].join()),
        "password": passwordController.text,
        'passwordConfirmation': confirmPasswordController.text,
        /*   "type": SharedHandler.instance!
            .getData(key: SharedKeys().userType, valueType: ValueType.int) */
      };
      /* if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) { */
      //newPasswordModel = await newPasswordRepo.newPasswordRequest(data);
      // SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
      // AppRoutes.pushNamedNavigator(
      //     routeName: Routes.navBar, replacementAll: true);

      /*  SharedHandler.instance!
            .setData(SharedKeys().student, value: newPasswordModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: newPasswordModel.token);
        log('student otp token: ${newPasswordModel.token}');
        log('studentModel otp: ${newPasswordModel.toString()}');
      } else {
        log('data to repo : ${data.toString()}');
        teacherModel = await _newPasswordRepo.otpRequest(data);
        SharedHandler.instance!
            .setData(SharedKeys().teacher, value: teacherModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: teacherModel.token);
        log('teacher otp token: ${teacherModel.token}');
        log('teacherModel register: ${teacherModel.toString()}'); */
      // }
      /* userModel = await _authRepo.resetPasswordRequest(data);
      await SharedHandler.instance!
          .setData(SharedKeys().user, value: userModel.client!.toJson());
      await SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
      await SharedHandler.instance!
          .setData(SharedKeys().isNotFirstTime, value: true); */
      //SharedHandler.saveLoginData(_authModel);
      //SharedHandler.setData(_authModel);
      //log(' ${_loginModel.client!.accessToken!}');
      /* _userModel.client!.isValid!
   /*          ?  */
      SharedHandler.instance!.getData(
                  key: SharedKeys().userType, valueType: ValueType.int) ==
              0
          ? AppRoutes.pushNamedNavigator(
              routeName: Routes.clientNavBar, replacementAll: true)
          : AppRoutes.pushNamedNavigator(
              routeName: Routes.driverNavBar, replacementAll: true); */
      /* : AppRoutes.pushNamedNavigator(
                routeName: Routes.emailVerification, replacement: true); */
      //emit(NewPasswordLoaded());
      //}
    } catch (e) {
      log('reset Password :${e.toString()}');
      //emit(NewPasswordError());
    }
  }
}