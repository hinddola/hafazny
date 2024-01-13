import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/model/UserModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/home_screen/controller/home_controller.dart';
import 'package:hafazny/screens/home_screen/teacher_screen.dart';
import 'package:hafazny/screens/reservation_screen/controller/reservation_controller.dart';
import 'package:hafazny/screens/reservation_screen/reservation_screen.dart';
import 'package:hafazny/screens/session_screen/controller/session_controller.dart';
import 'package:hafazny/screens/teacher_screen/teacher_success_reservation_screen.dart';
import 'package:intl/intl.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';
import '../screens/favourite_teachers_screen/controller/favourite_teachers_controller.dart';
import '../screens/nav_bar_screen/nav_bar_screen.dart';
import 'customed_button.dart';
import 'customed_form_field.dart';
import 'customed_sized_button.dart';
import '../screens/favourite_teachers_screen/favourite_teachers.dart';

class ReserveSession extends StatefulWidget {
  ReserveSession({super.key});

  @override
  State<ReserveSession> createState() => _ReserveSessionState();
}

class _ReserveSessionState extends State<ReserveSession> {

  final homeController = Get.put(HomeController());
  final authController = Get.put(AuthController());
  UserModel userModel = UserModel();
  final sessionController = Get.put(SessionController());
  final reservationController = Get.put(ReservationController());
  final s_teacher = null;
  bool facvr = false;
  final favTeacherController = Get.put(FavouriteTeachersController());




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          ElevatedButton(
            onPressed: () async {
              await homeController.favTeacher(context: context , teacherId: homeController.selectedTeacherInfo.id );
              favTeacherController.getFavouriteTeachers();
              //Get.to(TeachersScreen());

            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(48, 48),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  width: 1,
                  color: Theme.of(context)
                      .colorScheme
                      .background
                      .withOpacity(.1),
                ),
              ),
              backgroundColor: homeController.isTeacherFav
                  ? ColorStyle.redColor.withOpacity(0.2)
                  : ColorStyle.lightNavyColor.withOpacity(0.3),
            ),
            child: SvgPicture.asset(
              ImagesHelper.favoriteIcon,
              color: homeController.isTeacherFav
                  ? ColorStyle.redColor
                  : ColorStyle.primaryColor,
            ),
          ),

          CustomSizedButton(
            title: ' حجز موعد لوقت لاحق',
            size: Size(350.w, 60.h),
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) => SingleChildScrollView(
                  child: Container(
                    padding : EdgeInsets.all(10),
                    height: 410.h,
                    width:200.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'حجز موعد',
                          style: TextStyleHelper.subtitle19,
                        ),
                        Text(
                          ' ${homeController.selectedTeacherInfo.name}قم بحجز جلسة مع ',
                          style: TextStyleHelper.body15.copyWith(
                              color: ColorStyle.lightNavyColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: reservationController.dateController,
                          readOnly: true,
                          onTap: () {
                            reservationController.startDateMethod(context);
                          },
                          style: TextStyle(
                            color: ColorStyle.blackColor, // Change text color
                            fontSize: 16.0.sp, // Adjust font size
                            // Add more text style properties as needed
                          ),
                          decoration: InputDecoration(
                            labelText: 'اختر يوم الحجز',
                            hintText: 'قم بتحديد يوم الحجز',
                            hintStyle: TextStyleHelper.button13.copyWith(
                              color: ColorStyle.backArrowColor.withOpacity(.5),
                              fontWeight: FontWeight.normal,
                            ),
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              color: ColorStyle.primaryColor, // Change icon color
                            ),
                            labelStyle: const TextStyle(
                              color: ColorStyle.primaryColor, // Change label color
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: ColorStyle.primaryColor), // Change focused border color
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorStyle.lightNavyColor.withOpacity(.5)), // Change enabled border color
                            ),
                            // Add more decoration properties as needed
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        TextFormField(
                          controller: reservationController.timeController,
                          readOnly: true,
                          onTap: (){
                            reservationController.selectTime(context);
                          },
                          style:  TextStyle(
                          color: ColorStyle.blackColor, // Change text color
                          fontSize: 16.0.sp, // Adjust font size
                          // Add more text style properties as needed
                        ),
                        decoration: InputDecoration(
                          labelText: 'اختر الوقت ',
                          hintText: 'قم بتحديد وقت الحجز',
                          hintStyle: TextStyleHelper.button13.copyWith(
                            color: ColorStyle.backArrowColor.withOpacity(.5),
                            fontWeight: FontWeight.normal,
                          ),
                          suffixIcon: const Icon(
                            Icons.access_time_outlined,
                            color: ColorStyle.primaryColor, // Change icon color
                          ),
                          labelStyle: const TextStyle(
                            color: ColorStyle.primaryColor, // Change label color
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: ColorStyle.primaryColor), // Change focused border color
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorStyle.primaryColor.withOpacity(.5)), // Change enabled border color
                          ),
                        ),),
                        Spacer(),

                        CustomButton(
                          onPressed: () {
                            final start_d = reservationController.dateController.text;
                            final start_t = reservationController.timeController.text;

                            if (start_d.isNotEmpty && start_t.isNotEmpty) {

                              sessionController.createNewSession(
                                  startDate: start_d,
                                  startTime: start_t,
                                  teacherId: homeController.selectedTeacher
                              );

                              Get.snackbar(
                                'تم الحجز بنجاح',
                                'سيتم تنبيهك في موعد الحصة',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: ColorStyle.primaryColor,
                                colorText: Colors.white,
                              );

                              //Get.to(ReservationsScreen(isTeacherNavBar: false));

                              Get.to(TeacherReservationSuccessScreen());
                            } else {

                              Get.snackbar(
                                'خطأ',
                                'يجب تحديد وقت مناسب لحجز الجلسة!',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );

                            }


                          },

                          child: Text(
                            ' حجز الجلسة',
                            style: TextStyleHelper.button16
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                    ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

//
// showTimePicker(
// context: context,
// initialTime: TimeOfDay.now(),
// ).then((dynamic value)
// {
// timeController.text = value.format(context).toString();
// print(value.format(context));
// });