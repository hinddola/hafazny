import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/style.dart';

class PlanGoalsCard extends StatefulWidget {
  PlanGoalsCard({
    super.key,
  });

  @override
  State<PlanGoalsCard> createState() => _PlanGoalsCardState();
}

class _PlanGoalsCardState extends State<PlanGoalsCard> {
  int currentIndex = -1;

  List<String> planGoals =[
    'تجويد قراءة القرآن الكريم',
    'معرفة المتشابهات',
    'حفظ و قراءة القرآن الكريم',
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
            width: 200.w,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${planGoals[index]}' ,
                    style: TextStyleHelper.caption11.copyWith(
                        color: currentIndex == index
                            ? Colors.white
                            : ColorStyle.primaryColor,
                        fontSize: 14.sp,
                    ),
                  ),

                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
