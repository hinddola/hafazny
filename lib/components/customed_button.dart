import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafazny/const/style.dart';


class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String? text;
  final Color? background;
  final Color? textColor;
  final Widget? child;
  final double? width;
  final double? height;
  final bool? isOpacity;

  const CustomButton(
      {super.key,
        required this.onPressed,
        this.text,
        this.background,
        this.textColor,
        this.child,
        this.width, this.height, this.isOpacity
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: AnimatedContainer(
          width: width ?? 300 ,
          margin: EdgeInsets.symmetric(
            vertical: 8.r, /* horizontal: 16.r */
          ),
          height : 50.h,
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: background ?? ColorStyle.primaryColor,
              borderRadius: BorderRadius.circular(4.r)
          ),
          duration: const Duration(seconds: 1),
          child: child ??
              Text(text!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? ColorStyle.whiteColor
                  ),
              ),
        ),
      ),
    );
  }
}
