import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hafazny/model/TeachersDetailesModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/home_screen/controller/home_controller.dart';
import 'package:hafazny/screens/reservation_screen/reservation_day.dart';
import 'package:hafazny/screens/reservation_screen/reservation_month.dart';
import 'package:hafazny/screens/session_screen/session_detailes_screen.dart';
import 'package:hafazny/screens/start_call_screen/start_call_screen.dart';

import '../../components/active_avatar.dart';
import '../../components/customed_app_bar.dart';
import '../../components/teacher_detailes_text.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';
import 'controller/reservation_controller.dart';


class ReservationsScreen extends StatelessWidget {
  bool? isTeacherNavBar;
  ReservationsScreen({required this.isTeacherNavBar, super.key});
  final homeController = Get.put(HomeController());
  final reserveController = Get.put(ReservationController());
  final user = AuthController().getUserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'الحجوزات',
                isMainScreen: false,
              ),
              SizedBox(
                height: 15.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'حجوزات اليوم',
                    style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),

              FutureBuilder(
                  future: reserveController.getStudentSessions(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: Container(
                          height: 50.h,
                          width: 50.w,
                          child: const CircularProgressIndicator(
                              color: ColorStyle.primaryColor
                          )));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error loading data'));
                    } else {
                      if (reserveController.hasSessions == true) {
                        return Column(
                          children: List.generate(
                            reserveController.studentSessions.lectures!.length ,
                                (index) => Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                   Column(
                                     children: [
                                       // Text('${reserveController.dateController}'),
                                       // Text('${reserveController.timeController}'),
                                     ],
                                   ),
                                      Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${reserveController.studentSessions.lectures![index]?.teacher?.name}',
                                                style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '0.0',
                                                        style: TextStyleHelper.caption11,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(ImagesHelper.starIcon),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                      ),
                                      //TeacherDetailsText(index: index),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const ActiveAvatar(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(100.w, 50.h),
                                          backgroundColor: ColorStyle.redColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                        ),
                                        onPressed: () {

                                          // reserveController.cancelSession(index);
                                          // reserveController.update();

                                        },
                                        label: const Text('إلغاء'),
                                        icon: const Icon(Icons.cancel),
                                      ),

                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(250.w, 50.h),
                                          backgroundColor: ColorStyle.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                        ),
                                        onPressed: () {
                                          //Get.to(StartCallScreen());
                                          Get.to(SessionsDetailsScreen());
                                        },
                                        label: const Text('دخول الجلسة'),
                                        icon: SvgPicture.asset(ImagesHelper.videoIcon),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(child: Text("لا توجد جلسات محجوزة بعد" , style: TextStyle(
                          color:  ColorStyle.primaryColor,
                          fontWeight: FontWeight.bold ,
                        ),
                        ));
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}