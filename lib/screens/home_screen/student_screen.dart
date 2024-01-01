import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../components/customed_app_bar.dart';
import '../../components/customed_dots.dart';
import '../../components/customed_package.dart';
import '../../components/customed_slider.dart';
import '../../components/teacher_rate.dart';
import '../../const/style.dart';
import 'controller/home_controller.dart';

class StudentHomeScreen extends StatelessWidget {
  StudentHomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(isMainScreen: true,),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 450.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/quran.png', // Adjust the image path
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              GetBuilder<HomeController>(
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                        (index) => CustomDots(
                      width: 30.w,
                      color: 0 == index
                          ? ColorStyle.primaryColor
                          : ColorStyle.lightNavyColor.withOpacity(.1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomPackage(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'المعلمون الاكثر تقييما',
                    style: TextStyleHelper.subtitle17.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
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
                            Positioned(
                              bottom: 0,
                              right: 7,
                              child: CircleAvatar(
                                radius: 9,
                                backgroundColor: ColorStyle.greenColor.withOpacity(.1),
                                child: const CircleAvatar(
                                  radius: 7,
                                  backgroundColor: ColorStyle.greenColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'محمد ابراهيم احمد ',
                          style: TextStyleHelper.caption11,
                        ),
                        TeacherRate(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
