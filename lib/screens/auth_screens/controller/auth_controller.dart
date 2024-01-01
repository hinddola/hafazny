import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hafazny/helper/api_url/api_url.dart';
import 'package:hafazny/helper/shared_pref.dart';
import 'package:hafazny/model/LoginModel.dart';
import 'package:http/http.dart' as http ;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_validation.dart';
import '../../../const/style.dart';
import '../../nav_bar_screen/nav_bar_screen.dart';
import '../login_screen/login_repo.dart';
import '../otp_screen/otp_screen.dart';

class AuthController extends GetxController with Validations{

  bool isForgetPassword = false;
  ApiUrl apiUrl = ApiUrl();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController() ;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController loginPhoneNumberController = TextEditingController();
  String phoneNumberError = '';
  String roleId= '';

  TextEditingController loginEmailController = TextEditingController();

  TextEditingController loginPasswordController = TextEditingController();
  String passwordError = '';

  String genderValue = 'اختر';
  List<String> genderList = ['ذكر', 'أنثي'];

  List<int> roleIdList = [1, 2];

  UserLogin userLogin = UserLogin();


  updateGender(String value) {
    genderValue = value;
    log('gender value: $genderValue');
    update();
  }
  int? roleIdValue;

  updateRoleId(int value) {
    roleIdValue = value;
    print('roleId value: $roleIdValue');
    update();
  }


  @override
  void onInit() {
    super.onInit();

    // Set default value for the controller
    fullNameController.text = "Default Full Name";
  }

  register({
    required name,
    required email,
    required password,
    required passConfirmation,
    required phone,
    required gender,
    BuildContext? context,
  }) async {
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

    final response = await http.post(
      Uri.parse(apiUrl.register_path),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request_body),
    );

    if (response.statusCode == 200) {
      // Successful registration
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text('تم التسجيل بنجاح!'),
          backgroundColor: ColorStyle.primaryColor,
        ),
      );
      Get.to(() => OTPScreen()); // Navigate to the OTP screen
    } else {
      // Handle registration failure (show an error message, etc.)
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text('فشل في التسجيل!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  logIn({required email, required password}) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl.loginUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'password': password.text,
          'email': email.text,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login
        _saveUserData(response.body);
        // Get.offAll(() => NavBarScreen(currentIndex: 4,)); // Navigate to the home screen
      } else {
        // Failed login
        // Show error message
        Get.snackbar(
          'Login Failed',
          'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Error: $e");
      // Show a generic error message
      Get.snackbar(
        'Error',
        'An error occurred during login',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  // logIn({ required email ,required password})async{
  //   final response = await http.post(
  //     Uri.parse(apiUrl.loginUrl),
  //     headers: {
  //       'Content-Type' : 'application/json',
  //     },
  //     body: jsonEncode(
  //         {
  //           'password': password.text,
  //           'email': email.text
  //         }
  //     ),
  //   ).then((value) {
  //     try {
  //       print("scss");
  //
  //       _saveUserData(value.body);
  //     } catch(e){
  //       print("errror");
  //
  //       print(e);
  //     }
  //
  //   });
  //
  // }

  clearSignUpData() {
    fullNameController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    emailController.clear();
    update();
  }

  clearLoginData() {
    loginPhoneNumberController.clear();
    loginPasswordController.clear();
  }
  _saveUserData(data) {
    data = jsonDecode(data);
    SharedPreferanceHelper.saveData(key: 'token', value: data['token']);
    SharedPreferanceHelper.saveData(key: 'user', value: jsonEncode(data['user']));
  }
  getUserToken() {
    String _token = SharedPreferanceHelper.getData(key: 'token');
    if (_token != null) {
      return _token;
    }

    return null;
  }
  getUserData() {
    final userdata = SharedPreferanceHelper.getData(key: 'user');
    if (userdata != null) {
      return UserLogin.fromJson(jsonDecode(userdata));
    }

    return null;
  }

}
