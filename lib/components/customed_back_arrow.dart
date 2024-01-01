
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafazny/const/style.dart';

class CustomArrowBack extends StatelessWidget {
  final bool isAuth;
  const CustomArrowBack({
    super.key,
    this.isAuth=false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:isAuth? EdgeInsets.only(right: 100.0.r):EdgeInsets.zero,
      child: Ink(
        decoration: BoxDecoration(
            color: ColorStyle.backArrowColor.withOpacity(.1),
            shape: BoxShape.circle
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Platform.isIOS
              ? Icon(
            Icons.arrow_back_ios,
            size: 25.sp,
          )
              : Icon(
            Icons.arrow_back,
            size: 25.sp,
          ),
        ),
      ),
    );
  }
}
