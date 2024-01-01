import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const/style.dart';

class PercentageComonent extends StatelessWidget {
  PercentageComonent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 30.h,
            width: 30.h,
            child:  const CircularProgressIndicator(
              semanticsLabel: '50%',
              color: ColorStyle.primaryColor,
              //backgroundColor: ColorStyle.greyColor.shade50,
              //strokeAlign: -1,
              strokeWidth: 40,
              value: .4,
            ),
          ),
          Container(
            height: 110.h,
            width: 110.h,
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
                Text('40%', style: TextStyleHelper.title22.copyWith(
                  fontSize: 18.sp
                )),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
