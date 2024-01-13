import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/reservation_screen/reservation_day.dart';
import 'package:hafazny/screens/reservation_screen/reservation_month.dart';

import '../../components/active_avatar.dart';
import '../../components/customed_app_bar.dart';
import '../../components/teacher_detailes_text.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';
import '../reservation_screen/controller/reservation_controller.dart';
import '../start_call_screen/start_call_screen.dart';

class TeacherReservationsScreen extends StatelessWidget {
  TeacherReservationsScreen({super.key});

  final reserveController = Get.put(ReservationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0.r),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'الحجوزات', isMainScreen: false,
              ),
              SizedBox(
                height: 15.h,
              ),
              // ReservationMonth(),
              // ReservationDay(),
              SizedBox(
                height: 20.h,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       'حجوزات اليوم',
              //       style: TextStyleHelper.body15
              //           .copyWith(fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20.h,
              ),




              FutureBuilder(
                  future: reserveController.getTeacherSessions(),
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
                      return const Center(child: Text('Error loading data'));
                    } else {
                      return
                      reserveController.teacherHasSessions ?
                        Column(
                        children: List.generate(
                          reserveController.teacherSessions.lectures!.length ,
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
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(ImagesHelper.deleteIcon),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${reserveController.teacherSessions.lectures![index]?.student?.name}',
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(300.w, 50.h),
                                        backgroundColor: ColorStyle.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(28),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(StartCallScreen());
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
                      )
                          :  const Center(child: Text('لا توجد حجوزات بعد' , style: TextStyle(
                        color: ColorStyle.primaryColor,
                        fontWeight: FontWeight.bold
                      ),));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
