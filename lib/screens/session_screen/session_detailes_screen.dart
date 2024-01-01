import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/nav_bar_screen/nav_bar_screen.dart';
import 'package:hafazny/screens/session_screen/controller/session_controller.dart';
import 'package:hafazny/screens/teacher_screen/teacher_rate_screen.dart';

import '../../components/active_avatar.dart';
import '../../components/custome_rating.dart';
import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../components/session_detailes_card.dart';
import '../../components/teacher_detailes_text.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';

class SessionsDetailsScreen extends StatelessWidget {
   SessionsDetailsScreen({super.key});

  final controller = Get.put(SessionController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'تفاصيل الجلسة',
          style:
          TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: .0,
        leading: const CustomArrowBack(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorStyle.backArrowColor.withOpacity(.1),
                  shape: BoxShape.circle
              ),
              child: IconButton(
                  onPressed: (){},
                  icon: Image.asset(
                    'assets/images/Vector.png',
                    width: 25.w,
                    height: 25.h,
                  )
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // const CustomBackAppBar(title:),
              SizedBox(
                height: 40.h,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagesHelper.deleteIcon),
                    ),
                    const Spacer(),
                    const TeacherDetailsText(
                      isSessions: true,
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    const ActiveAvatar(isSessions: true),

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'تسجيل الجلسة' ,
                      style: TextStyleHelper.body15
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text('${controller.sliderValue.value.toStringAsFixed(2)}')),
                        Obx(() =>
                            Slider(
                              value: controller.sliderValue.value,
                              min: 0,
                              max: 200.0,
                              onChanged: (value) {
                                controller.sliderValue.value = value;
                              },
                              activeColor: ColorStyle.primaryColor,
                              inactiveColor: ColorStyle.primaryColor.withOpacity(0.2),
                            ),
                        ),
                        Container(
                          width: 30.w,
                          height: 30.h,
                          padding: EdgeInsets.all(4.0), // Adjust the padding as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorStyle.primaryColor, // Choose the border color
                              width: 1.0, // Adjust the border width
                            ),
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/triangle.svg',
                            color: ColorStyle.primaryColor,
                            width: 5.w,
                            height: 5.h,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SessionDetailsCard(content:controller.content),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRating(),
                        Text(
                          'تعليق',
                          style: TextStyleHelper.body15
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      'يساعدك تحديد هذه المعلومات على تجربة تعليمية مناسبة لك وتسهيل الوصول لمعلم القران المناسب',
                      style: TextStyleHelper.body15.copyWith(
                          color: ColorStyle.lightNavyColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressed: () {
                  Get.to(TeacherRateScreen());
                },
                child: Text(
                  'تقييم الجلسة',
                  style: TextStyleHelper.button16.copyWith(color: Colors.white),
                ),
              ),
              CustomButton(
                onPressed: () {
                  Get.to(NavBarScreen(currentIndex: 1));
                  //Navigator.pop(context);
                },
                background: ColorStyle.skipTextColor,
                child: Text(
                  'العودة للجلسات',
                  style: TextStyleHelper.button16.copyWith(color: Colors.white),
                ),
                //textColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
