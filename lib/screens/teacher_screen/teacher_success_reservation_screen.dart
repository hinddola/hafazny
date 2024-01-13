import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/nav_bar_screen/nav_bar_screen.dart';
import 'package:hafazny/screens/reservation_screen/reservation_screen.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/teacher_reservation_screen.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/teacher_session_detailes_screen.dart';
import 'package:hafazny/screens/teacher_screen/controller/controller.dart';
import 'package:hafazny/screens/teacher_screen/teacher_detailes_screen.dart';

import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../const/style.dart';
import '../session_screen/session_detailes_screen.dart';

class TeacherReservationSuccessScreen extends StatelessWidget {
  TeacherReservationSuccessScreen({super.key});

  final controller = Get.put(TeacherSuccessResController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align
                  (alignment: Alignment.centerLeft,
                  child: CustomArrowBack(),
                ),
                SizedBox(
                  height: 150.h,
                ),
                const CircleAvatar(
                  radius: 50,
                  //backgroundColor: ColorStyle.greyColor,
                  backgroundImage: const AssetImage('assets/images/219986.png'),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'تهانينا تم الحجز بنجاح',
                  style: TextStyleHelper.subtitle19,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'تم حجز الحصة بنجاح وسيتم التواصل معك من قبل المعلم',
                  style: TextStyleHelper.body15
                      .copyWith(color: ColorStyle.lightNavyColor),
                  textAlign: TextAlign.center,
                ),

                const Spacer(),
                CustomButton(
                  onPressed: () {
                    //Get.to( ReservationsScreen(isTeacherNavBar: false,));
                    // Get.to(NavBarScreen(currentIndex: 3,));
                    Get.to(SessionsDetailsScreen());
                  },
                  text: 'دخول الجلسة',
                ),
                CustomButton(
                  onPressed: () {
                    Get.to( ReservationsScreen(isTeacherNavBar: false,));
                    // Get.to(NavBarScreen(currentIndex: 3,));
                  },
                  text: 'راجع قائمة الحجوزات',
                ),
                CustomButton(
                  onPressed: () {
                    Get.to(NavBarScreen(currentIndex: 4));
                  },
                  text: 'العودة للرئيسية',
                  textColor: ColorStyle.skipTextColor,
                  background:
                  ColorStyle.skipTextColor.withOpacity(.1),
                )
              ],
            ),
          )),
    );
  }
}
