import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/auth_screens/controller/otp_controller.dart';
import 'package:hafazny/screens/edu_favorites_screens/edu_favourite_screen1.dart';

import '../../../components/customed_back_arrow.dart';
import '../../../components/customed_button.dart';
import '../../../components/customed_text_button.dart';
import '../../../components/otp_code_field.dart';
import '../../../const/style.dart';
import '../../on_boarding_screens/controller/controller.dart';
import '../../teacher_screen/teacher_complete_data_sec_screen.dart';
import '../controller/auth_validation.dart';

class OTPScreen extends StatelessWidget {
   OTPScreen({super.key});

  final controller = Get.put(AuthController());

  final oTPcontroller = Get.put(OTPController());
  final onBoardingcontroller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    // var bloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(isAuth: true),
        leadingWidth: 180.w,
        toolbarHeight: 50.h,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('تفعيل رقم الجوال'),
          ],
        ),
        iconTheme: IconTheme.of(context).copyWith(color: Colors.black, size: 17.r),
        elevation: 0.0,
        titleTextStyle: TextStyleHelper.title22.copyWith(
            color: Colors.black,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.normal),
      ),
      body: SafeArea(
          child: Form(
            key: oTPcontroller.oTPFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'تم ارسال كود التفعيل المكون من 4 ارقام فى رسالة قصيرة على الرقم',
                              style: TextStyleHelper.body15
                                  .copyWith(color: ColorStyle.lightNavyColor),
                            ),
                            SizedBox(
                              height:30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: SvgPicture.asset(
                                    'assets/svg/edit_field_icon.svg' ,
                                    color: ColorStyle.greyColor,
                                    width: 35.w,
                                    height: 35.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                ),
                                Text(
                                  '+955 545355345',
                                  style: TextStyle(
                                    color: ColorStyle.primaryColor,
                                    fontSize: 24.sp
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:30.h,
                            ),
                            ///// make it list.generate
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  OTPCodeField(
                                    controller:oTPcontroller.codeController4,
                                  ),
                                  OTPCodeField(
                                    controller: oTPcontroller.codeController3,
                                  ),
                                  OTPCodeField(
                                    controller: oTPcontroller.codeController2,
                                  ),
                                  OTPCodeField(
                                    controller: oTPcontroller.codeController1,
                                  ),
                                ]),
                            SizedBox(
                              height: 30.h,
                            ),

                            CustomButton(
                              background:ColorStyle.primaryColor,
                              child: Text(
                                'تفعيل رقم الجوال',
                                style: TextStyleHelper.button16.copyWith(
                                  color: ColorStyle.whiteColor,
                                ),
                              ),
                              onPressed: () {
                                onBoardingcontroller.isStudent ?
                                Get.to(EduFavouriteFirstScreen()):
                                    Get.to(TeacherCompleteDataSecScreen());
                                ;
                              },

                            ),
                            CustomTextButton(
                                text: 'إعادة إرسال الكود',
                                onPressed: (){},
                            ),


                            //
                            // // if (state is loginLoaded) {
                            // CustomButton(
                            //
                            //   // width: state is OTPLoading
                            //   //     ? 13.w
                            //   //     : 10.w,
                            //
                            //   onPressed: () {
                            //     if (oTPcontroller.oTPFormKey.currentState!
                            //         .validate()) {
                            //       log('valid');
                            //
                            //       //  log('log ${OTPBloc.instance.emailController}');
                            //       log([
                            //         oTPcontroller.codeController1.text,
                            //         oTPcontroller.codeController2.text,
                            //         oTPcontroller.codeController3.text,
                            //         oTPcontroller.codeController4.text,
                            //       ].join());
                            //       // _formKey.currentState!.save();
                            //       //log(name);
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         const SnackBar(
                            //             content: Text('تم حفظ البيانات')),
                            //
                            //       );
                            //
                            //       ///OTPBloc.instance.add(OTPPost());
                            //
                            //
                            //     } else {
                            //       log('not valid');
                            //     }
                            //     log([
                            //       oTPcontroller.codeController1.text,
                            //       oTPcontroller.codeController2.text,
                            //       oTPcontroller.codeController3.text,
                            //       oTPcontroller.codeController4.text,
                            //     ].join());
                            //     //log('type= ${bloc.type}');
                            //   },
                            //
                            //
                            //
                            //   // child: state is OTPLoading
                            //   //     ? const CircularProgressIndicator(
                            //   //   color: Colors.white,
                            //   // )
                            //   //     : Text(
                            //   //   'تفعيل رقم الجوال',
                            //   //   style: TextStyleHelper.button16.copyWith(
                            //   //     color: Colors.white,
                            //   //   ),
                            //   // ),
                            //
                            //
                            //    /*  textColor: textColor */
                            // ),
                            // CustomTextButton(
                            //   text: 'اعادة ارسال الكود',
                            //   onPressed: () {},
                            // ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),

                            // state is OTPError
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
            ),
          )
    );

  }
}
