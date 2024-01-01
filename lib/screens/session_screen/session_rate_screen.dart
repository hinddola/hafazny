import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/custome_rating.dart';
import '../../components/customed_back_arrow.dart';
import '../../components/customed_button.dart';
import '../../const/style.dart';

class SessionsRateScreen extends StatefulWidget {
   SessionsRateScreen({super.key});

  @override
  State<SessionsRateScreen> createState() => _SessionsRateScreenState();
}

class _SessionsRateScreenState extends State<SessionsRateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100.w,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'تقييم الجلسة',
          style:
          TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0.r),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                const CircleAvatar(
                  radius: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'تقييم الجلسة',
                  style: TextStyleHelper.subtitle17
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                /*  SizedBox(
              height: 10,
            ), */
                Text(
                  'يوضع تقييم الجلسة في صفحة الجلسة',
                  style: TextStyleHelper.body15
                      .copyWith(color: Theme.of(context).colorScheme.background),
                ),
                const SizedBox(
                  height: 16,
                ),
                 CustomRating(
                  height: 32,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'اترك تعليق',
                    style: TextStyleHelper.body15
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0.r),
                    hintText: 'قم بكتابة تعليقك هنا',
                    hintStyle: TextStyleHelper.button13,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'إرسال التقييم',
                )
              ],
            ),
          )),
    );
  }
}
