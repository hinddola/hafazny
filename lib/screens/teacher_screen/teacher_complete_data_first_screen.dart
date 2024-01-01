import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/teacher_nav_bar_screen.dart';
import 'package:hafazny/screens/teacher_screen/teacher_complete_data_sec_screen.dart';

import '../../components/customed_button.dart';
import '../../const/style.dart';
import 'controller/controller.dart';

class TeacherCompleteDataFirstScreen extends StatelessWidget {
  TeacherCompleteDataFirstScreen ({Key? key}) : super(key: key);

  final controller = Get.put(TeacherSuccessResController());

  int chosenContent = -1;
  int partMemorized = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'التوافق مع رغبات المتعلم',
                style: TextStyleHelper.subtitle19,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ',
                style: TextStyleHelper.body15
                    .copyWith(color: ColorStyle.lightNavyColor),
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                  'حدد مسار الاتقان للمتعلم',
                  style: TextStyleHelper.body15.copyWith(
                    fontSize: 18.sp
                  )
              ),
              SizedBox(
                height: 10.h,
              ),
              // Container(
              //   // color: Colors.amber,
              //   height: 150.h,
              //   child: GetBuilder<TeacherSuccessResController>(
              //       builder: (controller){
              //         return GridView.builder(
              //           itemCount: controller.dataContent.length,
              //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 3,
              //               childAspectRatio: .3,
              //               crossAxisSpacing: 10,
              //               mainAxisSpacing: 10,
              //               mainAxisExtent: 50),
              //           itemBuilder: (context, index) => InkWell(
              //             onTap: () {
              //               chosenContent = index;
              //               controller.update();
              //             },
              //             child: Container(
              //               alignment: Alignment.center,
              //               decoration: BoxDecoration(
              //                   color: chosenContent == index
              //                       ? ColorStyle.primaryColor
              //                       : Colors.transparent,
              //                   border: chosenContent == index
              //                       ? const Border()
              //                       : Border.all(
              //                       color:ColorStyle.greyColor
              //                           .withOpacity(.2),
              //                       width: 1),
              //                   borderRadius: BorderRadius.circular(8)),
              //               child: Text(
              //                 controller.dataContent[index],
              //                 style: TextStyleHelper.button13.copyWith(
              //                     fontWeight: FontWeight.normal,
              //                     color: chosenContent == index
              //                         ? ColorStyle.whiteColor
              //                         : ColorStyle.lightNavyColor),
              //               ),
              //             ),
              //           ),
              //         );
              //   })
              // ),
               SizedBox(
                height: 20.h,
              ),
              Text('حدد تنظيم الخطة بالاجزاء ام السور',
                  style: TextStyleHelper.body15.copyWith(
                    fontSize: 18.sp
                  )),
               SizedBox(
                height: 10.h,
              ),
              Container(
                // color: Colors.amber,
                height: 150.h,
                // child: GetBuilder<TeacherSuccessResController>(
                //     builder: (controller){
                //       return GridView.builder(
                //         itemCount: controller.partMemorizedList.length,
                //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 3,
                //             childAspectRatio: .3,
                //             crossAxisSpacing: 10,
                //             mainAxisSpacing: 10,
                //             mainAxisExtent: 50),
                //         itemBuilder: (context, index) => InkWell(
                //           onTap: () {
                //             partMemorized = index;
                //             controller.update();
                //           },
                //           child: Container(
                //             alignment: Alignment.center,
                //             decoration: BoxDecoration(
                //                 color: partMemorized == index
                //                     ?ColorStyle.primaryColor
                //                     : Colors.transparent,
                //                 border: partMemorized == index
                //                     ? const Border()
                //                     : Border.all(
                //                     color:ColorStyle.greyColor
                //                         .withOpacity(.2),
                //                     width: 1),
                //                 borderRadius: BorderRadius.circular(8)),
                //             child: Text(
                //               controller.partMemorizedList[index],
                //               style: TextStyleHelper.button13.copyWith(
                //                   fontWeight: FontWeight.normal,
                //                   color: partMemorized == index
                //                       ? ColorStyle.whiteColor
                //                       : ColorStyle.lightNavyColor),
                //             ),
                //           ),
                //         ),
                //       );
                //     }
                // ),
              ),
              Spacer(),
              CustomButton(
                  text: 'التالي',
                  onPressed: () {
                    Get.to(TeacherNavBarScreen(currentIndex: 3,));
                  }),
              CustomButton(
                onPressed: () {
                  const snackBar = SnackBar(
                    content: Text('يجب استكمال البيانات المطلوبة'),
                    backgroundColor: ColorStyle.redColor,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //AppRoutes.pushNamedNavigator(routeName: Routes.navBar);
                },
                text: 'تخطي اعداد التوافق',
                textColor: ColorStyle.skipTextColor,
                background: ColorStyle.skipTextColor.withOpacity(.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
