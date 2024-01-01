import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';

class StudentDetailsText extends StatelessWidget {
  const StudentDetailsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'الطالب : محمد ابراهيم احمد',
          style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'المدة : 43.00 دقيقة',
          style: TextStyleHelper.caption11.copyWith(
              fontSize: 14.sp
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
             ' \$الربح : 1.535',
              style: TextStyleHelper.caption11.copyWith(
                fontSize: 14.sp
              ),
            ),

          ],
        )
      ],
    );
  }
}
