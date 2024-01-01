import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/customed_app_bar.dart';
import '../../components/customed_form_field.dart';
import '../../components/customed_sized_button.dart';
import '../../components/teacher_detailes_card.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';
import '../teacher_screen/teacher_detailes_screen.dart';

class TeachersScreen extends StatelessWidget {
   TeachersScreen({super.key});

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
                title: 'المعلمون',
              ),
              const SizedBox(
                height: 40,
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
                      'المفضلون',
                      style: TextStyleHelper.body15.copyWith(
                          color: ColorStyle.lightNavyColor
                              .withOpacity(.5)),
                    ),
                  ),
                  CustomSizedButton(
                      title: 'كل المعلمون',
                      size: const Size(165, 48),
                      onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                  customSuffixIconButton: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: SvgPicture.asset(
                      ImagesHelper.filterIcon,
                      // height: MediaQueryHelper.height * .02,
                    ),
                  ),
                  customPreffixIconButton: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: SvgPicture.asset(
                      ImagesHelper.searchIcon,
                      // height: MediaQueryHelper.height * .02,
                    ),
                  ),
                  isLabeled: false,
                  isWidget: true,
                  isSearch: true,
                  hintText: 'ابحث عن معلم',
                  keyboardType: TextInputType.text,
                  controller: controller
              ),
              const SizedBox(
                height: 10,
              ),
              TeacherDetailsCard(
                onTap: () => Get.to(TeacherDetialsScreen())
              )
            ],
          ),
        ),
      ),
    );
  }
}
