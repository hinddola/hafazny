
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/model/EduLevelModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/edu_favorites_screens/controller/edu_favourites_controller.dart';
import 'package:hafazny/screens/profile_screen/controller/profile_controller.dart';

import '../../components/custome_upload_image.dart';
import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../components/customed_form_field.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';
import '../../model/PathModel.dart';
import '../teacher_screen/controller/controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(ProfileController());
  EduLevelModel eduLevelModel = EduLevelModel();
  final authController = Get.put(AuthController());
  final eduFavouritesController = Get.put(EduFavouritesController());
  final user = AuthController().getUserData();
  final sIngleUserModel = ProfileController().sIngleUserModel;

  final teacherController = Get.put(TeacherSuccessResController());


  @override
  Widget build(BuildContext context) {
    controller.fullNameController.text = user?.name;
    controller.phoneNumberController.text = user?.phone;
    controller.emailController.text = user?.email;
    controller.genderController.text = user?.gender == 'male' ? 'ذكر' : 'انثى';


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
                           '${user?.name}' ,
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
                            Text(
                              'بيانات الحساب',
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
                          // iconWidget:
                          // SvgPicture.asset(
                          //   ImagesHelper.editFieldIcon ,
                          //   color: ColorStyle.lightNavyColor.withOpacity(0.5),
                          // ),
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
                          // iconWidget:
                          // SvgPicture.asset(ImagesHelper.editFieldIcon ,
                          //   color: ColorStyle.lightNavyColor.withOpacity(0.5),
                          // ),
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
                          // iconWidget:
                          // SvgPicture.asset(ImagesHelper.editFieldIcon,
                          //   color: ColorStyle.lightNavyColor.withOpacity(0.5),
                          // ),
                          isAuth: false,
                          hintText: controller.emailController.text,
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'حدد الجنس',
                          iconWidget:
                          SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                          controller.genderController.text,
                          keyboardType: TextInputType.text,
                          controller:
                          controller.genderController),
                      SizedBox(
                        height: 10.h,
                      ),
                      // CustomFormField(
                      //   // validator: isValidPhone,
                      //     isLabeled: true,
                      //     labelText: 'حدد الجنسية',
                      //     iconWidget:
                      //     SvgPicture.asset(ImagesHelper.dropDownIcon),
                      //     isAuth: false,
                      //     hintText:
                      //     controller.nationalityController.text,
                      //     keyboardType: TextInputType.text,
                      //     controller:
                      //     controller.nationalityController),
                      SizedBox(
                        height: 40.h,
                      ),

                      user.roleId == 1 ?
                      Column(
                        children: [
                          FutureBuilder(
                            future: eduFavouritesController.getPaths(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: Container(
                                    height: 50.h,
                                    width: 50.w,
                                    child: CircularProgressIndicator(
                                        color: ColorStyle.primaryColor
                                    )));
                              } else if (snapshot.hasError) {
                                return Text('Error loading data');
                              } else {
                                return Container(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: eduFavouritesController.pathsList.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final path = eduFavouritesController.pathsList![index];
                                      var slt_id = null;

                                      sIngleUserModel.userPaths?.map((value) {

                                        if (value.id == path.id) {
                                          slt_id = value.pathItemId;
                                        }
                                      });
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${path?.title}',
                                                style: TextStyleHelper.title22.copyWith(
                                                  color: ColorStyle.navyColor,
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          DropdownButtonFormField(
                                            decoration: const InputDecoration(
                                              isDense: true,
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: ColorStyle.primaryColor, width: 2.0),
                                              ),
                                            ),
                                            hint: Text('حدد المسارات التعليمية'),

                                            value: slt_id,  // Set the correct selected value here
                                            items: path.pathItems?.map((value) {
                                              return DropdownMenuItem(
                                                value: value.id,  // Ensure that id is unique
                                                child: Text('${value.title}'),
                                              );
                                            }).toList(),
                                            onChanged: (selectedValue) {
                                              eduFavouritesController.selectedValue(selectedValue as int?);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ) ,

                        ],
                      ):

                      SizedBox(
                        height: 30.h,
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          onPressed: () {
                            controller.updateUserData(
                                name: controller.fullNameController,
                                email: controller.emailController,
                                // roleId: onBoardingController.roleId,
                                phone: controller.phoneNumberController,
                                gender: controller.genderController,
                            );
                            // Navigator.pop(context);
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
