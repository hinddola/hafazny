import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hafazny/components/teacher_detailes_text.dart';

import 'active_avatar.dart';

class TeacherDetailsCard extends StatelessWidget {
  final bool isSessions;
  final Function()? onTap;
  const TeacherDetailsCard({
    super.key,
    this.isSessions = false, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        10,
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
              leading:IconButton(
                  onPressed: () {},
                  icon: Platform.isIOS
                      ? const Icon(Icons.arrow_back_ios)
                      : const Icon(Icons.arrow_back)),
              contentPadding: const EdgeInsetsDirectional.only(start: 5),

              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TeacherDetailsText(isSessions: isSessions),
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
