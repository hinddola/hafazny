import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/auth_screens/controller/forget_password_controller.dart';

import '../../../components/customed_back_arrow.dart';
import '../../../components/customed_button.dart';
import '../../../components/customed_form_field.dart';
import '../../../const/style.dart';
import '../../../helper/image_helper.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final controller = Get.put(ForgetPasswordController());
  final authController = Get.put(AuthController());

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
            const Text('نسيت كلمة المرور'),
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
          child: Padding(
            padding: EdgeInsets.all(10.0.r),
            child: Form(
              key: controller.forgetPasswordFormKey,
              autovalidateMode: AutovalidateMode.always,
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(
                            height:10.h,
                          ),
                          CustomFormField(
                              labelText: 'البريد الإلكتروني',
                              validator: authController.isValidEmail,
                              icon: ImagesHelper.email,
                              hintText: 'قم بادخال البريد الإلكتروني',
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.emailController ),
                          SizedBox(
                            height: 30.h,
                          ),

                          CustomButton(
                            background:ColorStyle.primaryColor,
                            onPressed: (){},
                            child: Text(
                              'استرجاع كلمة المرور',
                              style: TextStyleHelper.button16.copyWith(
                                color: ColorStyle.whiteColor,
                              ),
                            ),
                          ),



                          // CustomButton(
                          //   // width: state is ForgetPasswordLoading
                          //   //     ? 13.w
                          //   //     : 10.w,
                          //   onPressed: () {
                          //     if (controller.forgetPasswordFormKey.currentState!.validate()) {
                          //       log('valid');
                          //       ///ForgetPasswordBloc.instance.add(ForgetPasswordPost());
                          //       /*  AppRoutes.pushNamedNavigator(
                          //       routeName: Routes.newPassword); */
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         const SnackBar(content: Text('تم ارسال الكود')),
                          //       );
                          //
                          //     } else {
                          //       log('not valid');
                          //     }
                          //
                          //     //log('type= ${bloc.type}');
                          //   },
                          //
                          //
                          //   // child: state is ForgetPasswordLoading
                          //   //     ? const CircularProgressIndicator(
                          //   //   color: Colors.white,
                          //   // ) : Text(
                          //   //   'تفعيل رقم الجوال',
                          //   //   style: TextStyleHelper.button16.copyWith(
                          //   //     color: Colors.white,
                          //   //   ),
                          //   // ),
                          //   /*  textColor: textColor */
                          // ),
                          // SizedBox(
                          //   height:10.h,
                          // ),

                          // state is ForgetPasswordError
                          //     ? Text(
                          //   'هناك خطا في البيانات',
                          //   style: TextStyleHelper.button16,
                          // ) : const SizedBox()

                        ],
                      )
                  ),
                ),
              ),
            ),
          )
    );

  }
}
