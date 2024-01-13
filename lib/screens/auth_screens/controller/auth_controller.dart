import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:hafazny/helper/shared_pref.dart';
import 'package:hafazny/model/LoginModel.dart';
import 'package:hafazny/screens/edu_favorites_screens/edu_favourite_screen1.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/teacher_nav_bar_screen.dart';
import 'package:http/http.dart' as http ;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_validation.dart';
import '../../../const/style.dart';
import '../../nav_bar_screen/nav_bar_screen.dart';
import '../../on_boarding_screens/controller/controller.dart';
import '../../packages_screen/packages_screen.dart';
import '../../teacher_screen/teacher_complete_data_sec_screen.dart';
import '../otp_screen/otp_screen.dart';

class AuthController extends GetxController with Validations{

  bool isForgetPassword = false;
  ApiUrl apiUrl = ApiUrl();
  final onBoardingController = OnBoardingController() ;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController() ;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController loginPhoneNumberController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();



  String phoneNumberError = '';
  String roleId= '';
  String passwordError = '';
  String genderValue = 'اختر';
  List<String> genderList = ['ذكر', 'أنثي'];
  UserLogin userLogin = UserLogin();


  register({
    required name,
    required email,
    required password,
    required passConfirmation,
    required phone,
    required gender,
    BuildContext? context,
  }) async {
    try {
      String _gender = "female";
      gender.toString() == "ذكر" ?  _gender = "male" : _gender = "female";

      final request_body = {
        "name": name.text,
        "email": email.text,
        "password": password.text,
        "password_confirmation": passConfirmation.text,
        "role_id": int.parse(roleId),
        "phone": phone.text,
        "gender": _gender
      };

      print("request_body $request_body");

      final response = await http.post(
        Uri.parse(apiUrl.register_path),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request_body),
      );

      if (response.statusCode == 201) {
        Get.snackbar(
          'تم التسجيل بنجاح',
          '',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorStyle.primaryColor,
          colorText: Colors.white,
        );
        saveUserData(response.body);
        print("check st ${onBoardingController.isStudent}");
        roleId == '1'
            ? Get.to(EduFavouriteFirstScreen())
            : Get.to(TeacherCompleteDataSecScreen());

      } else {
        Get.snackbar(
          'فشل في التسجيل!','',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,);

      }
    } catch (e) {
      Get.snackbar(
        'فشل في التسجيل!',
        '$e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  logIn({required email, required password}) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl.loginUrl),
        headers: { 'Content-Type': 'application/json' },
        body: jsonEncode({
          'password': password.text,
          'email': email.text,
        }),
      );

      if (response.statusCode == 200) {
        saveUserData(response.body);

        roleId == '1'
            ? Get.to(NavBarScreen(currentIndex: 4))
            : Get.to(TeacherNavBarScreen(currentIndex: 3));

      } else {
        // Show error message
        Get.snackbar(
          'تعذر الدخول!',
          'برجاء ادخال بياناتك صحيحة!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'تعذر الدخول!',
        'برجاء ادخال بياناتك صحيحة!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  signOut(){
    SharedPreferanceHelper.removeData('user');
    SharedPreferanceHelper.removeData('token');
  }

  updateGender(String value) {
    genderValue = value;
    log('gender value: $genderValue');
    update();
  }

  saveUserData(data) {
    data = jsonDecode(data);
      SharedPreferanceHelper.saveData(key: 'token', value: data['token']);
    SharedPreferanceHelper.saveData(key: 'user', value: jsonEncode(data['user']));
  }

  updateUserData(data) {
    data = jsonDecode(data);
    SharedPreferanceHelper.saveData(key: 'user', value: jsonEncode(data['user']));

  }
  Future<String?> getUserToken() async {
    String? _token = SharedPreferanceHelper.getData(key: 'token');
    print(_token);
    return _token;
  }
  getUserData() {
    final userdata = SharedPreferanceHelper.getData(key: 'user');
    if (userdata != null) {
      return UserLogin.fromJson(jsonDecode(userdata));
    }

    return null;
  }
  Future<LoginModel?> checkUser() async {
    // SharedPreferanceHelper.removeData('token');
    String? token = await getUserToken();

    final l = LoginModel(token: token, user: null);

    print("TOKEN ${l.token}");

    return LoginModel(token: token, user: null);
  }


}
