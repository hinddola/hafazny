import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/style.dart';

class PartsOrPagesCard extends StatefulWidget {
  PartsOrPagesCard({
    super.key,
  });

  @override
  State<PartsOrPagesCard> createState() => _PartsOrPagesCardState();
}

class _PartsOrPagesCardState extends State<PartsOrPagesCard> {
  int currentIndex = -1;
  List<String> partsOrPages =[
    ' صفحات',
    'سورة',
    'جزء',
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
                '${partsOrPages[index]}' ,
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
