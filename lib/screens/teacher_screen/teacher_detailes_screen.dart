import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/home_screen/controller/home_controller.dart';

import '../../components/customed_notification_icon.dart';
import '../../components/profile_button.dart';
import '../../components/reserve_session.dart';
import '../../components/teacher_rate.dart';
import '../../const/style.dart';

class TeacherDetialsScreen extends StatelessWidget {
  final  u;
  TeacherDetialsScreen({super.key, this.u});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //leading: CustomNotificationIcon(),
        title: Text(
          'تفاصيل المعلم',
          style: TextStyleHelper.subtitle19.copyWith(color: ColorStyle.whiteColor),
        ),
        backgroundColor: ColorStyle.primaryColor,
        elevation: .0,
        /* leading: CustomArrowBack(), */
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            //padding: EdgeInsets.all(10.0.r),
            physics: const ClampingScrollPhysics(),
            child: FutureBuilder(
                future: homeController.getTecherProfile(u.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {

                    return Center(child: Container(
                        height: 50.h,
                        width: 50.w,
                        child: CircularProgressIndicator(
                            color: ColorStyle.primaryColor
                        )));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error loading data'));
                  } else {
                    return  Container(
                      width: double.infinity,
                      //height: 500.h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorStyle.primaryColor,
                            ColorStyle.primaryColor,
                            ColorStyle.primaryColor,
                            Colors.white,
                            Colors.white,
                            Colors.white
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 80.h,
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0.r),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80.h,
                                    ),
                                    Text(
                                      '${u?.name}',
                                      //'${homeController.teacherProfileModel.teacherProfiles![10]?.user?.name}',
                                      style: TextStyleHelper.subtitle19,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'غير متصل الأن',
                                          style: TextStyleHelper.body15,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        // const CircleAvatar(
                                        //   radius: 6,
                                        //   backgroundColor: Colors.green,
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    const TeacherRate(),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    const ProfileButtons(),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'نبذه عن المعلم',
                                        style: TextStyleHelper.body15.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${homeController.teacherProfileModel.teacherProfile?.bio}',
                                              style: TextStyleHelper.body15.copyWith(
                                                  color:ColorStyle.lightNavyColor),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     Text(
                                    //       // ' حاصل على ${homeController.teacherProfileModel.teacherProfile.educationLevel?.name}',
                                    //
                                    //       // 'اجازة رواية حفص عن عاصم',
                                    //       style: TextStyleHelper.body15.copyWith(
                                    //         fontWeight: FontWeight.bold,
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 10.h,
                                    //     ),
                                    //     const Icon(
                                    //       Icons.check_circle,
                                    //       color: ColorStyle.primaryColor,
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 10.h,
                                    // ),

                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          ' حاصل على ${homeController.teacherProfileModel.teacherProfile?.educationLevel?.name}',
                                          style: TextStyleHelper.body15.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        const Icon(
                                          Icons.check_circle,
                                          color: ColorStyle.primaryColor,
                                        ),
                                      ],
                                    ),
                                     SizedBox(
                                      height: 120.h ,
                                    ),
                                    // Teacher actions button
                                    ReserveSession()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Positioned(
                            right:123,
                            top: 24,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 50,
                                //backgroundColor: Colors.grey,
                                backgroundImage: AssetImage('assets/images/219986.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }),
          )),
    );
  }
}
