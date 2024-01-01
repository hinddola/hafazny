import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/style.dart';

class SessionNumCard extends StatefulWidget {
  SessionNumCard({
    super.key,
  });

  @override
  State<SessionNumCard> createState() => _SessionNumCardState();
}

class _SessionNumCardState extends State<SessionNumCard> {
  int currentIndex = -1;

  List<String> sessionsNum =[
    '3 جلسات',
    'جلستين',
    'جلسة',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
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
               '${sessionsNum[index]}' ,
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
