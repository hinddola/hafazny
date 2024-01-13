
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/model/LoginModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/auth_screens/forget_password_screen/forget_password_screen.dart';
import 'package:hafazny/screens/auth_screens/register_screen/register_screen.dart';
import 'package:hafazny/screens/nav_bar_screen/nav_bar_screen.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/teacher_nav_bar_screen.dart';

import '../../../components/customed_back_arrow.dart';
import '../../../components/customed_button.dart';
import '../../../components/customed_form_field.dart';
import '../../../const/style.dart';
import '../../../helper/image_helper.dart';
import '../../../helper/shared_pref.dart';
import '../../on_boarding_screens/controller/controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen ({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());
  SharedPreferanceHelper sharedPref = SharedPreferanceHelper();
  LoginModel loginModel = LoginModel();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final onBoardingController = OnBoardingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(isAuth: true),
        leadingWidth: 180.w,
        toolbarHeight: 50.h,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'تسجيل الدخول' ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp
              ),
            ),
          ],
        ),
        iconTheme:
        IconTheme.of(context).copyWith(color: Colors.black, size: 17.r),
        elevation: 0.0,
        titleTextStyle: TextStyleHelper.title22.copyWith(
            color: Colors.black,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.normal),
      ),
      body: SafeArea(
          child: Form(
            key: loginFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(10.0.r),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFormField(
                            labelText: 'البريد الالكتروني',
                            validator: controller.isValidEmail,
                            icon: ImagesHelper.email,
                            hintText: 'ادخل البريد الالكتروني',
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.loginEmailController),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFormField(
                            labelText: 'كلمة المرور',
                            validator: controller.isValidPassword,
                            icon: ImagesHelper.password,
                            hintText: 'ادخل كلمة المرور',
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            controller: controller.loginPasswordController),
                        SizedBox(
                          height:10.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              controller.isForgetPassword = true;
                              Get.to(ForgetPasswordScreen());
                            },
                            child: Text(
                              '! نسيت كلمة المرور ',
                              style: TextStyleHelper.body15.copyWith(
                                  color: ColorStyle.primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        CustomButton(
                          background:ColorStyle.primaryColor,
                          onPressed: () async {
                            controller.logIn(
                                email: controller.loginEmailController,
                                password: controller.loginPasswordController
                            );

                            // if(onBoardingController.isStudent == true){
                            //   Get.to(NavBarScreen(currentIndex: 4,));
                            // } else if (onBoardingController.isStudent == false){
                            //   Get.to(() => TeacherNavBarScreen(currentIndex: 3));
                            // }

                          },
                          child: Text(
                            '  تسجيل الدخول',
                            style: TextStyleHelper.button16.copyWith(
                              color: ColorStyle.whiteColor,
                            ),
                          ),
                        ),
                        CustomButton(
                          background:ColorStyle.skipTextColor
                              .withOpacity(.1),
                          child:Text(
                            'ليس لديك حساب ؟ انشاء حساب جديد',
                            style: TextStyleHelper.button16.copyWith(
                              color: ColorStyle.skipTextColor,
                            ),
                          ),
                          onPressed: () {
                            Get.to(RegisterScreen());
                          },
                          /*  textColor: textColor */
                        ),
                      ],
                    )

                    //return const Text('');
                  ),
                ),
              ),
            ),
          )
    );

  }
}
