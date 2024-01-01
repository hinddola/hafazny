import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDots extends StatelessWidget {
  final Color color;
  final double width;

  const CustomDots({super.key, required this.color,required  this.width,});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 4,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        //shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
