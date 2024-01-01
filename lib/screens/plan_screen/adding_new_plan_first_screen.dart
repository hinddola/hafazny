import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/components/customed_form_field.dart';
import 'package:hafazny/components/customed_text_button.dart';
import 'package:hafazny/components/session_num_card.dart';
import 'package:hafazny/screens/plan_screen/adding_new_plan_sec_screen.dart';
import 'package:hafazny/screens/reservation_screen/reservation_day.dart';

import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../components/days_card.dart';
import '../../const/style.dart';

class AddingNewPlanFirstScreen extends StatelessWidget {
  AddingNewPlanFirstScreen ({Key? key}) : super(key: key);

  final planAdreessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'إضافة خطة جديدة',
          style:
          TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomFormField(
                labelText: 'عنوان الخطة',
                  hintText: 'أضف عنوان مناسب للخطة',
                  keyboardType: TextInputType.text,
                  controller: planAdreessController
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomFormField(
                labelText: 'تاريخ بدأ الخطة',
                  hintText: 'اختر تاريخ بدأ الخطة',
                  keyboardType: TextInputType.text,
                  controller: planAdreessController,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اختر الأيام المفضلة للجلسة',
                    style:
                    TextStyleHelper.subtitle19 ,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              DaysCard(),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اختر عدد الجلسات في اليوم',
                    style:
                    TextStyleHelper.subtitle19 ,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SessionNumCard(),
              SizedBox(
                height: 20.h,
              ),
              CustomFormField(
                labelText: 'يرجى تحديد المدة الزمنية للجلسة',
                hintText: 'من 8 صباحا إلى 12 مساء',
                keyboardType: TextInputType.text,
                controller: planAdreessController,
              ),
              SizedBox(
                height: 140.h,
              ),
              CustomButton(
                onPressed: () {
                  Get.to(AddingNewPlanSecScreen());
                },
                text: 'التالي',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
