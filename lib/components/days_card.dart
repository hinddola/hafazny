import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/style.dart';

class DaysCard extends StatefulWidget {
  DaysCard({
    super.key,
  });

  @override
  State<DaysCard> createState() => _DaysCardState();
}

class _DaysCardState extends State<DaysCard> {
  int currentIndex = -1;
  List<String> daysName =[
    'الجمعة',
    'الخميس',
    'الأربعاء',
    'الثلاثاء',
    'الإثنين',
    'الأحد',
    'السبت'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) => InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: Container(
            width: 90.w,
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
                '${daysName[index]}',
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
