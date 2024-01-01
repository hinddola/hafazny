
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/profile_screen/controller/profile_controller.dart';

import '../../components/custome_upload_image.dart';
import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../components/customed_form_field.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'بيانات الحساب',
          style:
          TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
        child: Form(
          key: controller.profileFormKey,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: SingleChildScrollView(
                  padding: EdgeInsets.all(10.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: CustomUploadImage()),
                      SizedBox(
                        height: 10.h,
                      ),
                       Center(child: Text(
                           'محمد ابراهيم احمد' ,
                           style: TextStyleHelper.body15
                               .copyWith(fontWeight: FontWeight.bold))
                       ),
                       SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 60.h,
                        color: ColorStyle.backArrowColor.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('بيانات الحساب',
                                style: TextStyleHelper.title22.copyWith(
                                    color: ColorStyle.navyColor ,
                                  fontSize: 20.sp
                                ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                          isLabeled: true,
                          labelText: 'الاسم الكامل',
                          //   validator: isValidName,
                          hintText:
                          controller.fullNameController.text,
                          iconWidget:
                          SvgPicture.asset(
                            ImagesHelper.editFieldIcon ,
                            color: ColorStyle.lightNavyColor.withOpacity(0.5),
                          ),
                          isAuth: false,
                          keyboardType: TextInputType.name,
                          controller:controller.fullNameController),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'رقم الجوال',
                          iconWidget:
                          SvgPicture.asset(ImagesHelper.editFieldIcon ,
                            color: ColorStyle.lightNavyColor.withOpacity(0.5),
                          ),
                          isAuth: false,
                          hintText:
                          controller.phoneNumberController.text,
                          keyboardType: TextInputType.number,
                          controller:
                          controller.phoneNumberController),
                       SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                          isLabeled: true,
                          labelText: 'البريد الالكتروني',
                          //  validator: isValidEmail,
                          iconWidget:
                          SvgPicture.asset(ImagesHelper.editFieldIcon,
                            color: ColorStyle.lightNavyColor.withOpacity(0.5),
                          ),
                          isAuth: false,
                          hintText: controller.emailController.text,
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController),
                       SizedBox(
                        height: 10.h,
                      ),
                      // const Spacer(),
                      CustomFormField(
                        // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'حدد الجنس',
                          iconWidget:
                          SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                          controller.genderController.text,
                          keyboardType: TextInputType.number,
                          controller:
                          controller.genderController),
                       SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'حدد الجنسية',
                          iconWidget:
                          SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                          controller.nationalityController.text,
                          keyboardType: TextInputType.number,
                          controller:
                          controller.nationalityController),
                       SizedBox(
                        height: 40.h,
                      ),
                      Container(
                        height: 60.h,
                        color: ColorStyle.backArrowColor.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'تفضيلات المعلم',
                              style: TextStyleHelper.title22.copyWith(
                                  color: ColorStyle.navyColor ,
                                  fontSize: 20.sp
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'المسار التعليمي المراد تعلمة',
                          iconWidget:
                          SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                          controller.eduTrackController.text,
                          keyboardType: TextInputType.number,
                          controller:
                          controller.eduTrackController),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'الفئة العمرية التى تنتمي إليها',
                          iconWidget:
                          SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                          controller.ageRangeController.text,
                          keyboardType: TextInputType.number,
                          controller:
                          controller.ageRangeController),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'مستوي القراء والتسميع',
                          iconWidget:
                          SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                          controller.readWritelevelController.text,
                          keyboardType: TextInputType.number,
                          controller:
                          controller.readWritelevelController),
                       SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'حفظ التعديلات',
                            style: TextStyleHelper.button16.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          /*  textColor: textColor */
                        ),
                      ),
                    ],
                  ),
                )
          ),
        ),
      ),
    );
  }
}
