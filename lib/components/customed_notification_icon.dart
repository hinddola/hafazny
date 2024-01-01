import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/image_helper.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.0.r),
      child: Ink(
        decoration: BoxDecoration(
            color: const Color(0xff50617D).withOpacity(.1),
            shape: BoxShape.circle),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            //AppRoutes.pushNamedNavigator(routeName: Routes.notification);
          },
          icon: SvgPicture.asset(
            ImagesHelper.notificationIcon,
            /* height: 24,
          width: 24.w, */
          ),
        ),
      ),
    );
  }
}
