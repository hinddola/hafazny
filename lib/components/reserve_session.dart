import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/teacher_screen/teacher_success_reservation_screen.dart';
import 'package:intl/intl.dart';

import '../const/style.dart';
import '../helper/image_helper.dart';
import 'customed_button.dart';
import 'customed_form_field.dart';
import 'customed_sized_button.dart';

class ReserveSession extends StatefulWidget {
  const ReserveSession({super.key});

  @override
  State<ReserveSession> createState() => _ReserveSessionState();
}

class _ReserveSessionState extends State<ReserveSession> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? date;

  startDateMethod() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        date = value;
        log('start :${date.toString()}');

        dateController.text = '${date!.day}/${date!.month}/${date!.year}';
      });
      if (value == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(48, 48),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          width: 1,
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(.1))),
                  backgroundColor: const Color(0xffD04545).withOpacity(.2)),
              child: SvgPicture.asset(
                ImagesHelper.favoriteIcon,
                color: ColorStyle.navyColor,
              )),

          CustomSizedButton(
            title: 'حجز موعد لوقت لاحق',
            size: Size(350.w, 60.h),
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(32))),
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) => SingleChildScrollView(
                  child: Container(
                    padding : EdgeInsets.all(10),
                    height: 410.h,
                    width:200.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'حجز موعد',
                          style: TextStyleHelper.subtitle19,
                        ),
                        Text(
                          'قم بحجز جلسة مع محمد ابراهيم احمد',
                          style: TextStyleHelper.body15.copyWith(
                              color: ColorStyle.lightNavyColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                            isReadOnly: true,
                            labelText: 'اختر يوم الحجز',
                            isWidget: true,
                            customSuffixIconButton: IconButton(
                              onPressed: () {
                                startDateMethod();
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2022-08-25'),
                                ).then(( dynamic value)
                                {
                                  dateController.text = DateFormat.yMMMd().format(value);
                                });
                              },
                              icon: SvgPicture.asset(
                                ImagesHelper.sessionDateIcon,
                              ),
                            ),
                            hintText: 'قم بتحديد يوم الحجز',
                            keyboardType: TextInputType.text,
                            controller: dateController),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                            isReadOnly: true,
                            labelText: 'حدد الوقت',
                            isWidget: true,
                            customSuffixIconButton: IconButton(
                              onPressed: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((dynamic value)
                                {
                                  timeController.text = value.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              icon: SvgPicture.asset(
                                ImagesHelper.dropDownIcon,
                              ),
                            ),
                            hintText: 'قم بتحديد وقت الحجز',
                            keyboardType: TextInputType.text,
                            controller: timeController),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onPressed: () {
                            Get.to(TeacherReservationSuccessScreen());
                          },
                          child: Text(
                            ' حجز الجلسة',
                            style: TextStyleHelper.button16
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                    ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
