import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:io';


import '../const/style.dart';
import '../helper/image_helper.dart';
import '../screens/reservation_screen/controller/reservation_controller.dart';
import '../screens/teacher_nav_bar_screen/teacher_session_detailes_screen.dart';
import 'active_avatar.dart';

class CompletedCalls extends StatelessWidget {
  CompletedCalls({Key? key}) : super(key: key);

  final reserveController = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ FutureBuilder(
          future: reserveController.getTeacherSessions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading data'));
            } else {
              return Column(
                children:   List.generate(
                  reserveController.teacherSessions.lectures!.length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: (){
                        Get.to(TeacherSessionsDetailsScreen());
                      },
                      child: ListTile(
                        //titleAlignment: ListTileTitleAlignment.center,
                        minVerticalPadding: 15,
                        //  contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey.shade300, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        horizontalTitleGap: 8,
                        leading: IconButton(
                            onPressed: () {
                              Get.to(TeacherSessionsDetailsScreen());
                            },
                            icon: Platform.isIOS
                                ? const Icon(Icons.arrow_back_ios)
                                : const Icon(Icons.arrow_back)),
                        contentPadding: const EdgeInsetsDirectional.only(start: 5),

                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${reserveController.teacherSessions.lectures![index]?.student?.name!}',
                                  style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'المدة : 43.00 دقيقة',
                                  style: TextStyleHelper.caption11.copyWith(
                                      fontSize: 14.sp
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' \$الربح : 1.535',
                                      style: TextStyleHelper.caption11.copyWith(
                                          fontSize: 14.sp
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        trailing:  Image.asset(
                            'assets/images/219986.png'
                        ),

                      ),
                    ),
                  ),
                ),
              );
            }
          }),]
    );









    // return Column(
    //   children: [
    //     FutureBuilder(
    //         future: reserveController.getTeacherSessions(),
    //         builder: (context, snapshot) {
    //           if (snapshot.connectionState == ConnectionState.waiting) {
    //             return Center(child: CircularProgressIndicator());
    //           } else if (snapshot.hasError) {
    //             return Center(child: Text('Error loading data'));
    //           } else {
    //             return Column(
    //               children: List.generate(
    //                 reserveController.teacherSessions.lectures!.length,
    //                 (index) => Container(
    //                   padding: const EdgeInsets.all(16),
    //                   margin: const EdgeInsets.only(bottom: 16),
    //                   decoration: BoxDecoration(
    //                     border: Border.all(color: Colors.grey.shade300),
    //                     borderRadius: BorderRadius.circular(4),
    //                   ),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           IconButton(
    //                             onPressed: () {},
    //                             icon: SvgPicture.asset(ImagesHelper.deleteIcon),
    //                           ),
    //                           const Spacer(),
    //                           Expanded(
    //                               child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.end,
    //                             children: [
    //                               Text(
    //                                 '${reserveController.teacherSessions.lectures![index]?.student?.name}',
    //                                 style: TextStyleHelper.body15
    //                                     .copyWith(fontWeight: FontWeight.bold),
    //                               ),
    //                               Column(
    //                                 children: [
    //                                   Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.end,
    //                                     children: [
    //                                       Text(
    //                                         '4.5',
    //                                         style: TextStyleHelper.caption11,
    //                                       ),
    //                                       const SizedBox(
    //                                         width: 5,
    //                                       ),
    //                                       SvgPicture.asset(
    //                                           ImagesHelper.starIcon),
    //                                     ],
    //                                   ),
    //                                 ],
    //                               )
    //                             ],
    //                           )),
    //                           //TeacherDetailsText(index: index),
    //                           const SizedBox(
    //                             width: 10,
    //                           ),
    //                           const ActiveAvatar(),
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 10,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           ElevatedButton.icon(
    //                             style: ElevatedButton.styleFrom(
    //                               minimumSize: Size(300.w, 50.h),
    //                               backgroundColor: ColorStyle.primaryColor,
    //                               shape: RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(28),
    //                               ),
    //                             ),
    //                             onPressed: () {},
    //                             label: const Text('دخول الجلسة'),
    //                             icon: SvgPicture.asset(ImagesHelper.videoIcon),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             );
    //           }
    //         }),
    //   ],
    // );
  }
}
