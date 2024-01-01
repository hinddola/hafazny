import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';

class PlanDetailsText extends StatelessWidget {
  final bool isSessions;

  const PlanDetailsText({
    super.key,
    this.isSessions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'اسم الخطة',
          style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  '40.0%',
                  style: TextStyleHelper.caption11,
                ),

                Text(
                  'مراجعة',
                  style: TextStyleHelper.caption11.copyWith(
                    color: ColorStyle.primaryColor
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'من جزء 1 الى جزء 2 ',
                  style: TextStyleHelper.caption11,
                ),

                Text(
                  'الترتيب',
                  style: TextStyleHelper.caption11.copyWith(
                    color: ColorStyle.primaryColor
                  ),
                ),
              ],
            ),
          ],
        ),

          ],

    );
  }
}
