import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hafazny/components/teacher_detailes_text.dart';
import 'package:hafazny/const/style.dart';

import 'active_avatar.dart';

class EkhtaratTeachersCard extends StatelessWidget {
  final bool isSessions;
  final Function()? onTap;
  EkhtaratTeachersCard({
    super.key,
    this.isSessions = false, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: onTap,
            child: ListTile(
              //titleAlignment: ListTileTitleAlignment.center,
              minVerticalPadding: 15,
              //  contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              horizontalTitleGap: 8,
              leading: TextButton(
                  onPressed: (){},
                  child: const Text(
                    'تقييم' ,
                    style: TextStyle(
                      color: ColorStyle.skipTextColor
                    ),
                  ),
              ),
              contentPadding: const EdgeInsetsDirectional.only(start: 5),

              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //TeacherDetailsText(isSessions: isSessions),
                ],
              ),

              trailing:  ActiveAvatar(isSessions: isSessions),

            ),
          ),
        ),
      ),
    );
  }
}
