import 'package:flutter/material.dart';
import 'package:hafazny/const/style.dart';

class MissedCalls extends StatelessWidget {
  MissedCalls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              'لا توجد مكالمات' ,
              style: TextStyle(
              color: ColorStyle.primaryColor,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );
  }
}
