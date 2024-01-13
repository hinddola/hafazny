import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/components/teacher_detailes_text.dart';
import 'package:hafazny/screens/home_screen/controller/home_controller.dart';
import 'package:hafazny/screens/session_screen/session_detailes_screen.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';
import '../model/TeachersDetailesModel.dart';
import '../screens/teacher_screen/teacher_detailes_screen.dart';
import 'active_avatar.dart';

class TeacherDetailsCard extends StatelessWidget {
  bool? isSessions;

  final Function(Teachers)? onTap;

  TeacherDetailsCard({
    super.key,
    this.isSessions = false, this.onTap,
  });

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: homeController.getTeachersDetailes(),
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
            return  Column(
              children: List.generate(
                homeController.teachersDetailesModel.teachers?.length as int,
                  (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
                    onTap:  () {
                      final u = homeController.teachersDetailesModel.teachers![index];
                      homeController.selectedTeacherInfo = u;
                      homeController.checkFavTeacher(u.id);

                      Get.to(TeacherDetialsScreen(u: u,));
                    }, //onTap!(homeController.teachersDetailesModel.teachers![index]),
                    child: ListTile(
                      //titleAlignment: ListTileTitleAlignment.center,
                      minVerticalPadding: 15,
                      //  contentPadding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(4)),
                      horizontalTitleGap: 8,
                      leading:IconButton(
                      onPressed: () {
                        final u = homeController.teachersDetailesModel.teachers![index];
                        homeController.checkFavTeacher(u.id);

                        Get.to(TeacherDetialsScreen(u: u,));

                      },
                          //onTap!(homeController.teachersDetailesModel.teachers![index]),
                      icon: Platform.isIOS
                          ? const Icon(Icons.arrow_back_ios)
                          : const Icon(Icons.arrow_back)),
                      contentPadding: const EdgeInsetsDirectional.only(start: 5),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //TeacherDetailsText(isSessions: isSessions!),
                          TeacherDetailsText(index: index),
                        ],
                      ),

                       trailing:  ActiveAvatar(isSessions: isSessions!),

                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
