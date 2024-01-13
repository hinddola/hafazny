import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/active_avatar.dart';
import '../../components/custome_rating.dart';
import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../components/customed_form_field.dart';
import '../../const/style.dart';

class TeacherRateScreen extends StatelessWidget {
  TeacherRateScreen({Key? key}) : super(key: key);

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'تقييم المعلم',
          style:
              TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              const CircleAvatar(
                radius: 50,
                //backgroundColor: ColorStyle.greyColor,
                backgroundImage: AssetImage('assets/images/219986.png'),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                'قيم أداء المعلم',
                style: TextStyleHelper.subtitle19,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'قم بتقييم أداء المعلم و يمكنك تحديد تعليق يوضع في صفحة المعلم ',
                style: TextStyleHelper.body15
                    .copyWith(color: ColorStyle.lightNavyColor,
                  fontSize: 18.sp
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomRating(),
              SizedBox(
                height: 80.h,
              ),
              CustomFormField(
                labelText: 'اترك تعليق',
                hintText: 'قم بكتابة تعليق للمعلم',
                keyboardType: TextInputType.text,
                controller: commentController,
              ),

              SizedBox(
                height: 150.h,
              ),
              CustomButton(
                onPressed: () {},
                child: Text(
                  'اعتماد التقييم',
                  style: TextStyleHelper.button16.copyWith(color: Colors.white),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
