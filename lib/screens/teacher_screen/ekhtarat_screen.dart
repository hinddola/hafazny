import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafazny/components/ekhtarat_teacher_card.dart';

import '../../components/customed_app_bar.dart';
import '../../components/customed_back_arrow.dart';
import '../../components/teacher_detailes_card.dart';
import '../../const/style.dart';

class EkhtaratScreen extends StatelessWidget {
  EkhtaratScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'إخطارات المعلم',
          style:
          TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0.r),
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                EkhtaratTeachersCard()
              ],
            ),
          )
      ),
    );
  }
}