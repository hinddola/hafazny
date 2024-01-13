import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hafazny/screens/teacher_screen/teacher_detailes_screen.dart';

import '../../components/customed_app_bar.dart';
import '../../components/customed_dots.dart';
import '../../components/customed_package.dart';
import '../../components/customed_slider.dart';
import '../../components/teacher_rate.dart';
import '../../const/style.dart';
import 'controller/home_controller.dart';

class StudentHomeScreen extends StatelessWidget {
  StudentHomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                isMainScreen: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder(
                  future: controller.getImageSlider(),
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
                      return CustomSlider();
                    }
                  }),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomPackage(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'المعلمون الاكثر تقييما',
                    style: TextStyleHelper.subtitle17
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: controller.getTeachersDetailes(),
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
                        height: 120,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.teachersDetailesModel.teachers?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    final u = controller.teachersDetailesModel.teachers![index];

                                    Get.to(TeacherDetialsScreen(u: u,));
                                  },
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundColor: ColorStyle.greyColor,
                                        child: Image.asset(
                                          'assets/images/219986.png',
                                          // Adjust the image path
                                          fit: BoxFit.fill,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Text(
                                  controller.teachersDetailesModel.teachers?[index].name ?? '',
                                  style: TextStyleHelper.caption11,
                                ),
                                TeacherRate(),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
