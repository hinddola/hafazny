import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';

class MenuCard extends StatelessWidget {
  final List<Map<String, dynamic>> content;
  //Function()? onTap ;
  Function()? onTap;

   MenuCard({
    super.key,
    required this.content,
     required this.onTap
     //required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        content.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: GestureDetector(
                  onTap: onTap,
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
      ),

    );
  }
}
