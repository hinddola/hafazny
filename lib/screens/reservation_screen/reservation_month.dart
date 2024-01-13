import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/style.dart';
import '../../helper/image_helper.dart';
import 'controller/reservation_controller.dart';

class ReservationMonth extends StatelessWidget {
   ReservationMonth({
    super.key,
  });

   final reservationController = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            reservationController.startDateMethod(context);
          },
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                },
                icon: SvgPicture.asset(
                  ImagesHelper.dropDownIcon,
                ),
              ),
               SizedBox(
                width: 5.w,
              ),
              Text(
                'اغسطس',
                style:
                TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
              ),
               SizedBox(
                width: 20.w,
              ),
              SvgPicture.asset(ImagesHelper.calenderIcon),


            ],
          ),
        ),
        const Spacer(),
        Text(
          'حدد يوم الحجز',
          style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
