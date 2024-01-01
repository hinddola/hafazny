import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/customed_app_bar.dart';
import '../../components/customed_button.dart';
import '../../components/menu_card.dart';
import '../../const/style.dart';
import '../../helper/image_helper.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(10.0.r),
          child: Column(
            children: [
               CustomAppBar(
                title: 'القائمة', isMainScreen: false,
              ),
              const SizedBox(
                height: 40,
              ),
               MenuCard(
                content: const [
                  {
                    'title': 'بيانات الحساب',
                    'icon': ImagesHelper.profileDetailsIcon,
                  },
                  {
                    'title': 'الباقات',
                    'icon': ImagesHelper.packagesIcon,
                    //'route': Routes.packages
                  },
                  {
                    'title': 'الرصيد',
                    'icon': ImagesHelper.uploadImageIcon,
                  }
                ],
              ),
               MenuCard(
                content: const [
                  {'title': 'القرآن الكريم', 'icon': ImagesHelper.quranIcon },
                  {'title': 'الخطة', 'icon': ImagesHelper.planIcon}
                ],
              ),
               MenuCard(
                content: const [
                  {
                    'title': 'الدعوات',
                    'icon': ImagesHelper.privacyPolicyIcon
                  },
                  {
                    'title': 'الإعدادات',
                    'icon': ImagesHelper.settingIcon
                  },
                  {'title': 'الدعم الفني',
                    'icon': ImagesHelper.callCenterIcon
                  }
                ],
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  // AppRoutes.pushNamedNavigator(
                  //   routeName: Routes.onboarding,
                  //   replacement: true,
                  //   arguments: 2);
                  },
                background: ColorStyle.redColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تسجيل الخروج',
                      style: TextStyleHelper.button16
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      ImagesHelper.logoutIcon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
