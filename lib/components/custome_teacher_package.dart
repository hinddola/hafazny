import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';

class CustomTeacherPackage extends StatelessWidget {
  CustomTeacherPackage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      //color: Colors.green,
      width: 300.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 120.h,
            width: 120.h,
            child: const CircularProgressIndicator(
              semanticsLabel: '50%',
              color: ColorStyle.skipTextColor,
              backgroundColor: Colors.white,
              //strokeAlign: -1,
              strokeWidth: 70,
              value: .3,
            ),
          ),
          Container(
            height: 170.h,
            width: 170.h,
            padding: EdgeInsets.all(8.0.r),
            decoration: BoxDecoration(
                color: ColorStyle.whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.r,
                    offset: const Offset(0, 0),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'مؤشر قياس الأداء',
                  style: TextStyleHelper.subtitle17
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text('40.5 %', style: TextStyleHelper.title22),
                Text(
                  ' ساعات من 10',
                  style: TextStyleHelper.caption11,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 2,
            child: Container(
              height: 70.h,
              width: 130.h,
              decoration: BoxDecoration(
                color: ColorStyle.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: ColorStyle.greyColor,
                    blurRadius: 4.r,
                    offset: const Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'رصيد اليوم',
                    style: TextStyleHelper.caption11.copyWith(
                        color:ColorStyle.whiteColor,
                        fontWeight: FontWeight.normal,
                      fontSize: 14.sp
                    ),
                  ),
                  Text(
                    '1.883 \$',
                    style: TextStyleHelper.subtitle17.copyWith(
                        color: ColorStyle.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
