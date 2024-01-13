import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/components/student_datailes_text.dart';
import 'package:hafazny/components/teacher_detailes_text.dart';
import 'dart:io';

import '../screens/teacher_nav_bar_screen/teacher_session_detailes_screen.dart';
import 'active_avatar.dart';

class StudentDetailesCard extends StatelessWidget {
  //final Function()? onTap;
  StudentDetailesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        10,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: (){
              Get.to(TeacherSessionsDetailsScreen());
            },
            child: ListTile(
              //titleAlignment: ListTileTitleAlignment.center,
              minVerticalPadding: 15,
              //  contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              horizontalTitleGap: 8,
              leading: IconButton(
                  onPressed: () {
                    Get.to(TeacherSessionsDetailsScreen());
                  },
                  icon: Platform.isIOS
                      ? const Icon(Icons.arrow_back_ios)
                      : const Icon(Icons.arrow_back)),
              contentPadding: const EdgeInsetsDirectional.only(start: 5),

              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StudentDetailsText(),
                ],
              ),
              trailing:  Image.asset(
                'assets/images/219986.png'
              ),

            ),
          ),
        ),
      ),
    );
  }
}
