import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hafazny/components/custome_teacher_package.dart';

import '../../components/custome_rating.dart';
import '../../components/customed_app_bar.dart';
import '../../components/customed_dots.dart';
import '../../components/customed_package.dart';
import '../../components/customed_slider.dart';
import '../../components/teacher_rate.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';
import 'controller/teacher_nav_bar_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.put(TeacherNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      //physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(10.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            isMainScreen: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 60.h,
            padding: const EdgeInsets.all(8),
            margin: EdgeInsets.only(bottom: 12.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorStyle.primaryColor.withOpacity(.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: ColorStyle.primaryColor.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Transform.scale(
                    scale: 1.2, // Adjust the scale factor as needed
                    child: Switch(
                      value: controller.isOnlinValue.value,
                      onChanged: (bool value) {
                        controller.isOnlineToggleSwitch();
                      },
                      activeTrackColor:
                          ColorStyle.primaryColor.withOpacity(0.5),
                      activeColor: ColorStyle.primaryColor,
                      inactiveTrackColor: ColorStyle.greyColor.withOpacity(0.5),
                      inactiveThumbColor: ColorStyle.greyColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200.w,
                ),
                Text(
                  'متاح الأن',
                  style: TextStyleHelper.subtitle19.copyWith(
                      fontSize: 18.sp, color: ColorStyle.primaryColor),
                ),
                Image.asset('assets/images/Group.png')
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTeacherPackage(),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'متوسط التقيمات',
                style: TextStyle(
                  color: ColorStyle.lightNavyColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '4.7',
                style: TextStyleHelper.body15
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 100.w,),
              CustomRating(),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'المكالمات الناجحة',
                style: TextStyle(
                    color: ColorStyle.lightNavyColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 120,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: ColorStyle.greyColor,
                          child: Image.asset(
                            'assets/images/user-128.png', // Adjust the image path
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'محمد ابراهيم احمد ',
                      style: TextStyleHelper.caption11.copyWith(
                        fontSize: 14.sp
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
        )
    );
  }
}
