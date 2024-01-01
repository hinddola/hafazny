import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/helper/shared_pref.dart';
import 'package:hafazny/model/UserModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/auth_screens/otp_screen/otp_screen.dart';
import 'package:hafazny/screens/on_boarding_screens/controller/controller.dart';

import '../../../components/customed_back_arrow.dart';
import '../../../components/customed_button.dart';
import '../../../components/customed_form_field.dart';
import '../../../const/style.dart';
import '../../../helper/image_helper.dart';
import '../../../helper/shared_handeller.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen ({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());
  final onBoardingController = Get.put(OnBoardingController()) ;
  UserModel userModel = UserModel();
  SharedPreferanceHelper sharedPref = SharedPreferanceHelper();

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
            Text('إنشاء حساب جديد'),
          ],
        ),
        iconTheme:
        IconTheme.of(context).copyWith(
            color: Colors.black,
            size: 17.r
        ),
        elevation: 0.0,
        titleTextStyle: TextStyleHelper.title22.copyWith(
            color: ColorStyle.blackColor,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.normal),
      ),
      body: SafeArea(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.update();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(10.0.r),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomFormField(
                              labelText: 'الاسم بالكامل',
                              validator: controller.isValidName,
                              icon:ImagesHelper.name,
                              hintText: 'قم بادخال الاسم',
                              keyboardType: TextInputType.name,
                              controller: controller.fullNameController),
                          SizedBox(
                            height:20.h,
                          ),
                          CustomFormField(
                              labelText: 'رقم الجوال',
                              validator: controller.isValidPhone,
                              icon: ImagesHelper.phone,
                              hintText: 'قم بادخال رقم الهاتف ',
                              keyboardType: TextInputType.phone,
                              controller: controller.phoneNumberController),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormField(
                            labelText: 'البريد الالكتروني',
                            validator: controller.isValidEmail,
                            icon: ImagesHelper.email,
                            hintText: 'قم بادخال البريد الالكتروني ',
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'النوع',
                                style: TextStyleHelper.body15
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DropdownButtonFormField(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            decoration: const InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(),
                            ),
                            hint: Text(controller.genderValue),
                            items: controller.genderList.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (gender) {
                              controller.updateGender(gender!);
                              controller.update();
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          CustomFormField(
                            labelText: 'كلمة المرور',
                            validator: controller.isValidPassword,
                            icon: ImagesHelper.password,
                            hintText: 'قم بادخال كلمة المرور ',
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            controller: controller.passwordController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "الرجاء ادخال كلمة المرور التأكيدية";
                                } else if (
                                value != controller.passwordController.text) {
                                  return "كلمة المرور غير متطابقة";
                                }
                                controller.update();
                                return null;
                              },
                              labelText: 'تأكيد كلمة المرور',
                              icon: ImagesHelper.password,
                              hintText: 'قم بادخال تأكيد كلمة المرور',
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              controller: controller.confirmPasswordController),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomButton(
                            background:ColorStyle.primaryColor,
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {

                                    controller.formKey.currentState!.save();
                                    controller.register(
                                        name: controller.fullNameController,
                                        email: controller.emailController,
                                        password: controller.passwordController,
                                        passConfirmation: controller.confirmPasswordController,
                                        // roleId: onBoardingController.roleId,
                                        phone: controller.phoneNumberController,
                                        gender: controller.genderValue
                                    );
                                    await SharedPreferanceHelper.saveData(key: 'username',value: controller.fullNameController.text);
                                    await SharedPreferanceHelper.saveData(key: 'email',value: controller.emailController.text);
                                    await SharedPreferanceHelper.saveData(key : 'phone',value: controller.phoneNumberController.text);
                                    await SharedPreferanceHelper.saveData(  key: 'gender', value: controller.genderValue,);
                                    await SharedPreferanceHelper.saveData(key: 'age',value: controller.ageController.text);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('تم التسجيل بنجاح!'),
                                        backgroundColor: ColorStyle.primaryColor
                                      ),
                                    );
                                    if(onBoardingController.isStudent == true){
                                      Get.to(() => OTPScreen());
                                      // print("roleId");
                                      // print(onBoardingController.roleId);
                                    } else if (onBoardingController.isStudent == false){
                                      Get.to(() => OTPScreen());
                                    }

                                  } else {
                                    print(' فشل انشاء الحساب ');
                                  }
                              // Get.to(OTPScreen());
                            },
                            child: Text(
                              'إنشاء حساب جديد',
                              style: TextStyleHelper.button16.copyWith(
                                color: ColorStyle.whiteColor,
                              ),
                            ),
                          ),
                          CustomButton(
                            background:ColorStyle.skipTextColor
                                .withOpacity(.1),
                            child: Text(
                              'لدي حساب بالفعل',
                              style: TextStyleHelper.button16.copyWith(
                                color: ColorStyle.skipTextColor,
                              ),
                            ),
                            onPressed: () {
                              Get.to(LoginScreen());
                            },

                          ),

                        ],
                      )
                ),
              ),
            ),
          )
      ),
    );
  }
}
