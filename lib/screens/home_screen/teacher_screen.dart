// teachers_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hafazny/screens/favourite_teachers_screen/favourite_teachers.dart';
import 'package:hafazny/screens/home_screen/controller/home_controller.dart';
import 'package:hafazny/screens/teacher_nav_bar_screen/teacher_nav_bar_screen.dart';

import '../../components/customed_app_bar.dart';
import '../../components/customed_form_field.dart';
import '../../components/customed_sized_button.dart';
import '../../components/teacher_detailes_card.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';
import '../../model/TeachersDetailesModel.dart';
import '../teacher_screen/teacher_detailes_screen.dart';
import 'controller/search_controller.dart';

class TeachersScreen extends StatelessWidget {
  int? index;

  TeachersScreen({super.key, this.index });

  final TextEditingController searchController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final homeController = Get.put(HomeController());
  final RxInt currentIndex = RxInt(1);
  final TeacherSearchController teacherSearchController = Get.put(TeacherSearchController());

  final List<String> teachersFav = [
    ' المفضلون ', //0
    ' كل المعلمون ', //1
  ];

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
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 70.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) => InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      currentIndex.value = index;
                    },
                    child: Obx(
                          () => Container(
                        width: 200.w,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: currentIndex.value == index
                              ? ColorStyle.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  teachersFav[index],
                                  style: TextStyleHelper.caption11.copyWith(
                                    color: currentIndex.value == index
                                        ? Colors.white
                                        : ColorStyle.lightNavyColor
                                        .withOpacity(.5),
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 40.h,
              ),



              Obx(() {
                switch (currentIndex.value) {
                  case 0:
                    return FavouriteTeachers();
                  case 1:
                    return TeacherDetailsCard();
                  default:
                    return TeacherDetailsCard(); // Return an empty container if needed
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
