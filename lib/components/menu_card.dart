import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';

class MenuCard extends StatelessWidget {
  final List<Map<String, dynamic>> content;
  //Function()? onTap ;

   MenuCard({
    super.key,
    required this.content,
     //required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: List.generate(
          content.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      content[index]['title'],
                      style: TextStyleHelper.subtitle17
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                     SizedBox(
                      width: 20.w,
                    ),
                    SvgPicture.asset(content[index]['icon'],
                      color: ColorStyle.primaryColor,
                    ),
                  ],
                ),
              ),
        ),

      ),
    );
  }
}
