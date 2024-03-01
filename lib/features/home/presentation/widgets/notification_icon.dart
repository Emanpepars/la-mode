import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/svg.dart';
import 'package:my_ecommerce_app/core/utils/app_colors.dart';
import 'package:my_ecommerce_app/core/utils/app_icons.dart';

class NotificationIcon extends StatelessWidget {
  final int notificationCount;
  final Function()? onPressed;

  const NotificationIcon({
    this.onPressed,
    required this.notificationCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool showCounter = notificationCount > 0;

    return showCounter
        ? badges.Badge(
            position: badges.BadgePosition.topEnd(
              top: 7.h,
              end: 9.5.w,
            ),
            badgeAnimation: const badges.BadgeAnimation.slide(
              curve: Curves.decelerate,
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: AppColors.gold,
              // borderSide: BorderSide(color: Colors.white, width: 3.w),
            ),
            badgeContent: const SizedBox(),
            child: IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(
                AppIcons.notification,
                height: 25.h,
              ),
            ),
          )
        : IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              AppIcons.notification,
              height: 20.h,
            ),
          );
  }
}
