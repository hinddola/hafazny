import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../components/customed_button.dart';
import '../../components/customed_form_field.dart';
import '../../const/style.dart';
import '../../model/CertificateModel.dart';
import '../../model/EduLevelModel.dart';
import 'controller/controller.dart';

class TeacherCompleteDataSecScreen extends StatelessWidget {
  TeacherCompleteDataSecScreen({Key? key}) : super(key: key);

  final controller = Get.put(TeacherSuccessResController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: GetBuilder<TeacherSuccessResController>(
          builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'استكمال بيانات المعلم',
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
                    height: 10.h,
                  ),
                  CustomFormField(
                    isLabeled: true,
                    labelText: 'نبذه مختصرة',
                    hintText: 'قم بكتابة نبذة مختصرة عنك',
                    keyboardType: TextInputType.text,
                    controller: controller.shortInfocontroller,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  FutureBuilder(
                      future: controller.getCertifications(),
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
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  'اختر إجازة',
                                  style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold)
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                // color: Colors.amber,
                                  height: 150.h,
                                  child: GetBuilder<TeacherSuccessResController>(
                                      builder: (controller){
                                        return GridView.builder(
                                          itemCount: controller.certificateModel.certifications?.length,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              childAspectRatio: .3,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              mainAxisExtent: 50),
                                          itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              if (controller.chosenContent.contains(
                                                  controller.certificateModel.certifications?[index].id
                                              )) {
                                                controller.chosenContent.remove(
                                                    controller.certificateModel.certifications?[index].id
                                                );
                                              } else {
                                                controller.chosenContent.add(
                                                    controller.certificateModel.certifications?[index].id as int
                                                );
                                              }
                                              controller.update();
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: controller.chosenContent.contains(controller.certificateModel.certifications?[index].id)
                                                    ? ColorStyle.primaryColor
                                                    : ColorStyle.lightNavyColor.withOpacity(0.1),

                                                border: controller.chosenContent.contains(controller.certificateModel.certifications?[index].id)
                                                    ? const Border()
                                                    : Border.all(
                                                    color:ColorStyle.greyColor,
                                                    width: 0.5),
                                                  borderRadius: BorderRadius.circular(8)),
                                              child: Text(
                                                '${controller.certificateModel.certifications?[index].name}',
                                                style: TextStyleHelper.button13.copyWith(
                                                    fontWeight: FontWeight.normal,
                                                    color: controller.chosenContent.contains(controller.certificateModel.certifications?[index].id)
                                                        ? ColorStyle.whiteColor
                                                        : ColorStyle.lightNavyColor),
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                              ),
                            ],
                          );

                          // return
                        }
                      }),

                  FutureBuilder(
                      future: controller.getEducationLevels(),
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
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  'حدد المستوى التعليمي',
                                  style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold)
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                  height: 150.h,
                                  child: GetBuilder<TeacherSuccessResController>(
                                      builder: (controller){
                                        return GridView.builder(
                                          itemCount: controller.eduLevelModel.educationLevels?.length,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              childAspectRatio: .3,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              mainAxisExtent: 50),
                                          itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              int selectedId = controller.eduLevelModel.educationLevels?[index].id ?? 0;
                                              controller.chosenEduLevel.clear();
                                              controller.chosenEduLevel.add(selectedId);
                                              controller.update();
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: controller.chosenEduLevel.contains(controller.eduLevelModel.educationLevels?[index].id)
                                                      ? ColorStyle.primaryColor
                                                      : ColorStyle.lightNavyColor.withOpacity(0.1),

                                                  border: controller.chosenEduLevel.contains(controller.eduLevelModel.educationLevels?[index].id)
                                                      ? const Border()
                                                      : Border.all(
                                                      color:ColorStyle.greyColor,
                                                      width: 0.5),
                                                  borderRadius: BorderRadius.circular(8)),
                                              child: Text(
                                                '${controller.eduLevelModel.educationLevels?[index].name}',
                                                style: TextStyleHelper.button13.copyWith(
                                                    fontWeight: FontWeight.normal,
                                                    color: controller.chosenEduLevel.contains(controller.eduLevelModel.educationLevels?[index].id)
                                                        ? ColorStyle.whiteColor
                                                        : ColorStyle.lightNavyColor),
                                                // color: ColorStyle.whiteColor),
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                              ),
                            ],
                          );

                          // return
                        }
                      }),

                  Spacer(),
                  CustomButton(
                    onPressed: () {
                      controller.createTeacherProfile();
                    },
                    text: 'التالى',
                  ),
                ],
                  ),
              );
          }),
        ),
      ),
    );
  }
}
