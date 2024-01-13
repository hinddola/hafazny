import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hafazny/const/style.dart';
import 'package:hafazny/screens/session_screen/session_detailes_screen.dart';

class StartCallScreen extends StatelessWidget {
  StartCallScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children:[
            Image.asset('assets/images/pluredImage.jpg' , height: double.infinity, fit: BoxFit.cover,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){},
                        icon: Icon(
                            Icons.settings_voice_sharp ,
                          color: ColorStyle.whiteColor,
                          size: 30.sp,
                        )
                    ),
                    IconButton(onPressed: (){},
                        icon: Icon(
                            Icons.headset_mic_rounded ,
                          color: ColorStyle.whiteColor,
                          size: 30.sp,
                        )
                    ),

                    IconButton(
                      onPressed: (){
                        Get.off(SessionsDetailsScreen());
                      },
                      icon:  Icon(
                        Icons.call_end,
                        color: ColorStyle.redColor,
                        size: 50.sp,
                      )
                    ),

                    IconButton(
                      onPressed: (){
                      },
                      icon: Icon(
                        Icons.video_call,
                        color: ColorStyle.whiteColor,
                        size: 30.sp,
                      )
                    ),
                  ],
                )
              ],
          ),
            ),]
        ),
      ),
    );
  }
}
