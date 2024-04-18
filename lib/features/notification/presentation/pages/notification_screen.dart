import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:la_mode/core/utils/app_colors.dart';

import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/text_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification'.tr(),
          style: roboto20(
            weight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppImages.search,
              height: 18.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 4.w),
            child: SvgPicture.asset(
              AppIcons.notification,
              height: 20.h,
              color: AppColors.gold,
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 40.h),
        child: Column(
          children: [
            const Items(count: 0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.notification,
                    width: 200.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Your Notification Is Empty'.tr(),
                    style: roboto20(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      'you don\'t have any notifications yet. Go back later.',
                      style: roboto16(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
