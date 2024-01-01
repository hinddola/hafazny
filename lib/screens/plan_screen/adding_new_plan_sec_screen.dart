import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/plan_screen/controller/plan_controller.dart';
import 'package:hafazny/screens/plan_screen/save_plan_screen.dart';

import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../components/customed_form_field.dart';
import '../../components/parts_or_pages_card.dart';
import '../../components/plan_goals.dart';
import '../../components/plan_track_card.dart';
import '../../components/session_num_card.dart';
import '../../const/style.dart';

class AddingNewPlanSecScreen extends StatelessWidget {
  AddingNewPlanSecScreen({Key? key}) : super(key: key);

  final controller =Get.put(PlanController());
  final partController = TextEditingController();

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
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'أضف المسار الذي تريده في الخطة',
                    style: TextStyleHelper.subtitle19,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              PlanTrackCard(),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'هل تريد تنظيم الخطة بالأجزاء أم السور',
                    style: TextStyleHelper.subtitle19,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              PartsOrPagesCard(),
              SizedBox(
                height: 20.h,
              ),
              CustomFormField(
                labelText: 'اختر الجزء المراد تعلمه',
                hintText: 'حدد الجزء',
                keyboardType: TextInputType.text,
                controller: partController,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomFormField(
                labelText: 'حدد عدد الصفحات',
                hintText: 'اختر عدد الأوجه',
                keyboardType: TextInputType.text,
                controller: partController,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'أهداف الخطة',
                    style: TextStyleHelper.subtitle19,
                  ),
                ],
              ),
              PlanGoalsCard(),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 90.h,
              ),
              CustomButton(
                onPressed: () {
                  Get.to(SavePlanScreen());
                },
                text: 'حفظ الخطة',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
