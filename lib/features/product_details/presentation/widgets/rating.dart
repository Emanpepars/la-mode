import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CuRatingBar extends StatelessWidget {
  final String text;
  final double? value;

  const CuRatingBar({required this.value, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: robotoCustomize(
            fontWeigh: FontWeight.w400,
            fontSize: 18.sp,
            color: AppColors.silverDark,
          ),
        ),
        SizedBox(
          width: 210.w,
          height: 10.h,
          child: LinearProgressIndicator(
            value: value,
            color: AppColors.primary,
            backgroundColor: AppColors.lightGray,
            borderRadius: BorderRadius.all(
              Radius.circular(
                4.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
