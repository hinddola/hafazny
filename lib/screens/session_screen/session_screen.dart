import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hafazny/screens/session_screen/session_detailes_screen.dart';

import '../../components/customed_app_bar.dart';
import '../../components/teacher_detailes_card.dart';

class SessionsScreen extends StatelessWidget {
   SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0.r),
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomAppBar(
                  title: 'الجلسات', isMainScreen: false,
                ),
                SizedBox(
                  height: 40,
                ),
                TeacherDetailsCard(
                  isSessions: true,
                  onTap: () {
                    Get.to(SessionsDetailsScreen());
                  },
                )
              ],
            ),
          )),
    );
  }
}
