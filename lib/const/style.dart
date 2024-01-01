import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorStyle {
  static const primaryColor = Color(0xff017457);
  static const blackColor = Colors.black;
  static const navyColor = Color(0xff192C4A);
  static const textColor = Color(0xff73777D);
  static const lightNavyColor = Color(0xff545F71);
  static const skipTextColor = Color(0xffD9AC6B);
  static const backArrowColor = Color(0xff50617D);
  static const whiteColor = Colors.white;
  static const greyColor = Colors.grey;
  static const greenColor = Colors.green;
  static const redColor = Colors.red;



}

abstract class TextStyleHelper {
  static TextStyle get title26 => TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xff192C4A),
  );
  static TextStyle get title22 => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xff192C4A),
  );
  static TextStyle get subtitle19 => TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xff192C4A),
  );
  static TextStyle get subtitle17 => TextStyle(
    fontSize: 17.sp,
    color: const Color(0xff192C4A),
    /* fontWeight: FontWeight.bold, */
  );
  static TextStyle get body15 => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: const Color(0xff192C4A),
  );
  static TextStyle get caption11 => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.normal,
    color: const Color(0xff545F71),

  );
  static TextStyle get button13 => TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle get button16 => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,

  );
}
