import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafazny/screens/reservation_screen/reservation_day.dart';
import 'package:hafazny/screens/reservation_screen/reservation_month.dart';

import '../../components/active_avatar.dart';
import '../../components/customed_app_bar.dart';
import '../../components/teacher_detailes_text.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';

class ReservationsScreen extends StatelessWidget {
  bool? isTeacherNavBar;
   ReservationsScreen({
     required this.isTeacherNavBar,
     super.key});


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
               ReservationMonth(),
               ReservationDay(),
               SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'حجوزات اليوم',
                    style: TextStyleHelper.body15
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
               SizedBox(
                height: 20.h,
              ),
              Column(
                children: List.generate(
                    4,
                        (index) => Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon:
                              SvgPicture.asset(ImagesHelper.deleteIcon),
                            ),
                            const Spacer(),
                            isTeacherNavBar! ?
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'الطالب : محمد ابراهيم احمد',
                                  style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:30 ص    20/9/2023',
                                  style: TextStyleHelper.caption11.copyWith(
                                      fontSize: 14.sp
                                  ),
                                ),
                              ],
                            ):  const TeacherDetailsText()
                          ,
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
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      150.w, 50.h),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(.1),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade300),
                                      borderRadius:
                                      BorderRadius.circular(28))),
                              child: Text(
                                'الآن',
                                style: TextStyleHelper.body15
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  minimumSize:  Size(
                                      220.w,
                                      50.h
                                  ),
                                  backgroundColor:
                                  ColorStyle.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  )),
                              onPressed: () {},
                              label: const Text('دخول الجلسة'),
                              icon:
                              SvgPicture.asset(ImagesHelper.videoIcon),
                            ),
                          ],
                        ),
                      ]),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
