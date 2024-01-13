import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';

class TeacherRate extends StatelessWidget {
  const TeacherRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(ImagesHelper.starIcon),
        const SizedBox(
          width: 5,
        ),
        Text(
          '0.0',
          style: TextStyleHelper.caption11,
        ),
      ],
    );
  }
}
