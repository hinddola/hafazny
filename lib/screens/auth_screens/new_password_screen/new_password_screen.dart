import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/auth_screens/controller/new_password_controller.dart';

import '../../../components/customed_back_arrow.dart';
import '../../../components/customed_button.dart';
import '../../../components/customed_form_field.dart';
import '../../../const/style.dart';
import '../../../helper/image_helper.dart';

class NewPasswordScreen extends StatelessWidget {
   NewPasswordScreen({super.key});

   final controller = Get.put(NewPasswordController());

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
          children: const [
            Text('كلمة مرور جديدة'),
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
            key: controller.newPasswordformKey,
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
                padding: EdgeInsets.all(24.0.r),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(
                            height:10.h,
                          ),

                          CustomFormField(
                              icon: ImagesHelper.password,
                              labelText: 'كلمة المرور الجديدة',
                              validator: controller.isValidPassword,
                              hintText: 'قم بادخال كلمة المرور الجديدة',
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              controller:
                              controller.passwordController),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomFormField(
                            labelText: 'تأكيد كلمة المرور الجديدة',
                            icon: ImagesHelper.password,
                            hintText: 'تأكيد كلمة المرور',
                            keyboardType: TextInputType.visiblePassword,
                            controller:
                            controller.confirmPasswordController,
                            isPassword: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "الرجاء ادخال كلمة المرور التأكيدية";
                              } else if (value !=
                                 controller.passwordController.text) {
                                return "كلمة المرور غير متطابقة";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),

                          CustomButton(
                            background:ColorStyle.primaryColor,
                            onPressed: (){},
                            child: Text(
                              'تأكيد كلمة المرور',
                              style: TextStyleHelper.button16.copyWith(
                                color: ColorStyle.whiteColor,
                              ),
                            ),
                          ),

                          // if (state is loginLoaded) {
                          // CustomButton(
                          //
                          //   // width: state is NewPasswordLoading
                          //   //     ? 13.w
                          //   //     : 10.w,
                          //
                          //
                          //   onPressed: () {
                          //     if (controller.newPasswordformKey.currentState!
                          //         .validate()) {
                          //       // _formKey.currentState!.save();
                          //       //log(name);
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         const SnackBar(content: Text('تم حفظ البيانات')),
                          //       );
                          //
                          //       ///NewPasswordBloc.instance.add(NewPasswordPost());
                          //
                          //     } else {
                          //       log('not valid');
                          //     }
                          //     //  log('type= ${bloc.type}');
                          //   },
                          //
                          //
                          //   // child: state is NewPasswordLoading
                          //   //     ? const CircularProgressIndicator(
                          //   //   color: Colors.white,
                          //   // ) : Text(
                          //   //   'تأكيد كلمة المرور',
                          //   //   style: TextStyleHelper.subtitle19.copyWith(
                          //   //     color: Colors.white,
                          //   //   ),
                          //   // ),
                          //
                          //
                          //   /*  textColor: textColor */
                          // ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),



                          // state is NewPasswordError
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
