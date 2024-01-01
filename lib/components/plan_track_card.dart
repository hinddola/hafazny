import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/style.dart';

class PlanTrackCard extends StatefulWidget {
  PlanTrackCard({
    super.key,
  });

  @override
  State<PlanTrackCard> createState() => _PlanTrackCardState();
}

class _PlanTrackCardState extends State<PlanTrackCard> {
  int currentIndex = -1;
  List<String> planTrack =[
    'حفظ و تثبيت',
    'إقراء و إجازة',
    'مراجعة',
    'تلقين',
    'تصحيح التلاوة',
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: Container(
            width: 130.w,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? ColorStyle.primaryColor
                  : Colors.transparent,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '${planTrack[index]}',
                style: TextStyleHelper.caption11.copyWith(
                    color: currentIndex == index
                        ? Colors.white
                        : ColorStyle.primaryColor,
                    fontSize: 14.sp
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
