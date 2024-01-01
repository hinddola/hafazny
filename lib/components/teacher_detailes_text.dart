import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';

class TeacherDetailsText extends StatelessWidget {
  final bool isSessions;

  const TeacherDetailsText({
    super.key,
    this.isSessions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'محمد ابراهيم احمد ',
          style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'اجازة رواية حفص عن عاصم',
          style: TextStyleHelper.caption11,
        ),
        isSessions
            ? const SizedBox(
                height: 5,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '4.5',
                    style: TextStyleHelper.caption11,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(ImagesHelper.starIcon),
                ],
              )
      ],
    );
  }
}
