import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/auth_screens/register_screen/register_screen.dart';
import 'package:hafazny/screens/nav_bar_screen/nav_bar_screen.dart';
import 'package:hafazny/screens/teacher_screen/teacher_complete_data_sec_screen.dart';
import '../../components/customed_button.dart';
import '../../components/customed_dots.dart';
import '../../components/on_boarding_button.dart';
import '../../const/style.dart';
import '../teacher_screen/controller/controller.dart';
import 'controller/controller.dart';


class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final controller = Get.put(OnBoardingController());
  final authCOntroller = Get.put(AuthController());
  final teacherController = Get.put(TeacherSuccessResController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              GetBuilder<OnBoardingController>(
                builder: (controller) => AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: controller.currentPage == controller.currentContent
                      ? 1.0
                      : 0.0,
                  child: Column(
                    children: [
                      Image.asset(
                        controller.content[controller.currentContent].image!,
                        height: 300.h,
                      ),
                      SizedBox(height: 70.h),
                      Text(
                        controller.content[controller.currentContent].title,
                        style: TextStyle(
                          color: ColorStyle.navyColor,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        controller.content[controller.currentContent].description,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          color: ColorStyle.textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              GetBuilder<OnBoardingController>(
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.content.length,
                    (index) => CustomDots(
                      width: 30.w,
                      color: controller.currentContent == index
                          ? ColorStyle.primaryColor
                          : ColorStyle.lightNavyColor.withOpacity(.1),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GetBuilder<OnBoardingController>(
                builder: (controller) =>
                    controller.currentContent == controller.content.length - 1
                        ? AnimatedOpacity(
                            duration: const Duration(seconds: 2),
                            opacity: controller.currentContent ==
                                    controller.currentContent
                                ? 1.0
                                : 0.0,
                            child: Column(
                              children: [
                                CustomButton(
                                  onPressed: () {
                                      // controller.roleId=1;
                                      authCOntroller.roleId='1';
                                      controller.isStudent= true;
                                      print("role====");
                                      print(authCOntroller.roleId);
                                    // controller.isStudent!?
                                     Get.to(RegisterScreen());
                                  },
                                  text: 'الدخول كطالب',
                                  background: ColorStyle.primaryColor,
                                ),
                                CustomButton(
                                  onPressed: () {
                                      // controller.roleId = 2;
                                      authCOntroller.roleId='2';
                                      controller.isStudent= false;

                                      print("role====");
                                      print(authCOntroller.roleId);
                                    Get.to(RegisterScreen());
                                  },
                                  text: 'الدخول كمعلم',
                                  textColor: ColorStyle.blackColor,
                                  background: ColorStyle.skipTextColor,
                                ),
                              ],
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OnBoardingButton(
                                width: 135.w,
                                height: 50.h,
                                onPressed: () {
                                 // Get.to(NavBarScreen());
                                  if (controller.currentPage == 0) {
                                    print("Reached the first page");
                                    controller.update();
                                  } else {
                                    controller.currentPage--;
                                    Future.delayed(
                                      const Duration(milliseconds: 50),
                                      () {
                                        controller.currentContent =
                                            controller.currentPage;
                                        controller.update();
                                      },
                                    );
                                  }
                                },
                                title: 'تخطي',
                                color: ColorStyle.skipTextColor.withOpacity(.1),
                                textColor: ColorStyle.skipTextColor,
                              ),
                              OnBoardingButton(
                                width: 135.w,
                                height: 50.h,
                                onPressed: () {
                                  if (controller.currentPage ==
                                      controller.content.length - 1) {
                                    print("Reached the last page");
                                    controller.update();
                                  } else {
                                    controller.currentPage++;
                                    Future.delayed(
                                      const Duration(milliseconds: 50),
                                      () {
                                        controller.currentContent =
                                            controller.currentPage;
                                        controller.update();
                                      },
                                    );
                                  }
                                },
                                title: 'التالي',
                                color: ColorStyle.primaryColor,
                                textColor: ColorStyle.whiteColor,
                              ),
                            ],
                          ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
