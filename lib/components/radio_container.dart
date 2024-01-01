import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../const/style.dart';
import '../screens/edu_favorites_screens/controller/edu_favourites_controller.dart';
class RadioComponent extends StatelessWidget {
  final int? value;
  final String? title;
  final String? description;
  final bool isSecScreen;
  final EduFavouritesController controller;

  RadioComponent({
    required this.value,
    this.description,
    this.title,
    required this.isSecScreen,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectedValue(value);
      },
      child: Container(
        width: isSecScreen ? 180.w : double.infinity,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: controller.selectedValue.value == value
              ? ColorStyle.lightNavyColor.withOpacity(0.2)
              : ColorStyle.backArrowColor.withOpacity(0.03),
          border: Border.all(
            color: ColorStyle.lightNavyColor.withOpacity(0.1),
            width: 2.0.w,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isSecScreen
                ? Expanded(
              child: Text(
                title!,
                style: const TextStyle(
                  color: ColorStyle.navyColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            )
                : Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                      color: ColorStyle.navyColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description!,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ColorStyle.navyColor,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            Obx(
                  () => Radio<int>(
                value: value!,
                activeColor: ColorStyle.primaryColor,
                groupValue: controller.selectedValue.value,
                onChanged: (int? newValue) {
                  controller.updateSelectedValue(value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
