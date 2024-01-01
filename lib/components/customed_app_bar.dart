import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafazny/helper/image_helper.dart';
import '../const/style.dart';
import 'customed_notification_icon.dart';

class CustomAppBar extends StatelessWidget {
  bool isMainScreen;
  String? title;

   CustomAppBar({
    Key? key,
     required this.isMainScreen,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: ColorStyle.greyColor.withOpacity(0.2),
            child: SvgPicture.asset(ImagesHelper.notificationIcon),
          ),
          SizedBox(width: 20.w,),
          isMainScreen ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'اهلا بك',
                style: TextStyleHelper.button16
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text('محمد ابراهيم احمد ',
                  style: TextStyleHelper.button13.copyWith(
                      color: ColorStyle.lightNavyColor,
                      fontWeight: FontWeight.normal
                  ),
                textAlign: TextAlign.center,
              ),
            ],
          ) :
              Text(
                  title!,
                  style: TextStyleHelper.button16,
                textAlign: TextAlign.center,
              ),

           const CircleAvatar(
            radius: 35,
            //backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/219986.png'),
          ),
        ],
      ),
    );
  }
}
