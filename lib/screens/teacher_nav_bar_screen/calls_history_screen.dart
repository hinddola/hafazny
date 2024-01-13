import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/teacher_session_detailes_screen.dart';

import '../../components/completed_calls_students_card.dart';
import '../../components/customed_app_bar.dart';
import '../../components/customed_form_field.dart';
import '../../components/customed_sized_button.dart';
import '../../components/missed_calls.dart';
import '../../components/student_detailes_card.dart';
import '../../components/teacher_detailes_card.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';

class CallsHistoryScreen extends StatelessWidget {
  CallsHistoryScreen({super.key});

  TextEditingController controller = TextEditingController();
  RxInt currentIndex = RxInt(1);

  List<String> calls = [
    ' مكالمات فائتة ', //0
    ' مكالمات مكتملة  ', //1
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            children: [
              CustomAppBar(
                isMainScreen: false,
                title: 'سجل المكالمات',
              ),
               SizedBox(
                height: 40.h,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SvgPicture.asset(
              //       ImagesHelper.filterIcon,
              //     ),
              //     Text(
              //       'الشهر الحالي',
              //       style: TextStyleHelper.body15.copyWith(
              //           color: ColorStyle.lightNavyColor ,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18.sp
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),

              Container(
                height: 70.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) => InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      currentIndex.value = index;
                    },
                    child: Obx(
                          () => Container(
                        width: 200.w,
                        height: 48.h,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: currentIndex.value == index
                              ? ColorStyle.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  calls[index],
                                  style:TextStyleHelper.button16.copyWith(
                                    color: currentIndex.value == index
                                        ? Colors.white
                                        :  ColorStyle.lightNavyColor
                                        .withOpacity(.5),
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),


               SizedBox(
                height: 10.h,
              ),

              Obx(() {
                switch (currentIndex.value) {
                  case 0:
                    return MissedCalls();
                  case 1:
                    return MissedCalls();

                 // return CompletedCalls();
                  default:
                    return CompletedCalls();

                    // return CompletedCalls(); // Return an empty container if needed
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
