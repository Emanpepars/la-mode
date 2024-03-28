import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:la_mode/core/utils/app_colors.dart';

class SocialMedia extends StatelessWidget {
  final String assetsName;

  const SocialMedia({required this.assetsName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 45.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.silverM,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            12.sp,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 7.h,
      ),
      child: SvgPicture.asset(
        assetsName,
      ),
    );
  }
}
