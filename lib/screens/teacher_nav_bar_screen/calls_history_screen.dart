import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/teacher_session_detailes_screen.dart';

import '../../components/customed_app_bar.dart';
import '../../components/customed_form_field.dart';
import '../../components/customed_sized_button.dart';
import '../../components/student_detailes_card.dart';
import '../../components/teacher_detailes_card.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';

class CallsHistoryScreen extends StatelessWidget {
  CallsHistoryScreen({super.key});

  TextEditingController controller = TextEditingController();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    ImagesHelper.filterIcon,
                  ),
                  Text(
                    'الشهر الحالي',
                    style: TextStyleHelper.body15.copyWith(
                        color: ColorStyle.lightNavyColor ,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                        minimumSize: const Size(165, 48)),
                    child: Text(
                      'مكالمات فائتة',
                      style: TextStyleHelper.body15.copyWith(
                          color: ColorStyle.lightNavyColor
                              .withOpacity(.5)),
                    ),
                  ),
                  CustomSizedButton(
                    title: ' مكالمات مكتملة',
                    size: const Size(165, 48),
                    onPressed: () {},
                  ),
                ],
              ),
               SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                  child: StudentDetailesCard(),
                onTap: (){
                    Get.to(TeacherSessionsDetailsScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
