
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafazny/const/style.dart';

import '../helper/image_helper.dart';
import 'customed_button.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          isOpacity: true,
          background: ColorStyle.primaryColor.withOpacity(.04),
          onPressed: () {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('مكالمة صوتية',
                    style: TextStyleHelper.button16
                ),
                 SizedBox(
                  width: 5.w,
                ),
                SvgPicture.asset(
                  ImagesHelper.callIcon,
                ),
              ]
          ),
        ),
        CustomButton(
          isOpacity: true,
          background: ColorStyle.skipTextColor
              .withOpacity(.04),
          onPressed: () {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('مكالمة فيديو',
                    style: TextStyleHelper.button16),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  ImagesHelper.videoIcon,
                  color: ColorStyle.primaryColor,
                ),
              ]),
        ),
      ],
    );
  }
}
