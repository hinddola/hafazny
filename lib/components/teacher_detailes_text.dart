import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hafazny/model/TeachersDetailesModel.dart';
import 'package:hafazny/screens/auth_screens/controller/auth_controller.dart';
import 'package:hafazny/screens/home_screen/controller/home_controller.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';
import '../screens/teacher_screen/controller/controller.dart';

class TeacherDetailsText extends StatelessWidget {
  //final bool isSessions;
  final index;

  TeacherDetailsText({
    Key? key,
    //this.isSessions = false,
    this.index
  }) : super(key: key);

  final homeController = Get.put(HomeController());
  //final teacherSuccessController = Get.put(TeacherSuccessResController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${homeController.teachersDetailesModel.teachers![index]?.name}',
          style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
        ),
        // isSessions
        //     ? const SizedBox(
        //   height: 5,
        // )
        //     : Column(
      Column(
              children: [
                Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
                Text(
                  '0.0',
                  style: TextStyleHelper.caption11,
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(ImagesHelper.starIcon),
          ],
        ),
              ],
            )
      ],
    )
    );
  }
}
