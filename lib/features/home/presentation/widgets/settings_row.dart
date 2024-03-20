import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class SettingsRow extends StatelessWidget {
  final String title;

  final bool isDes;
  final String des;

  final Function()? onPressed;

  const SettingsRow({
    required this.title,
    this.onPressed,
    super.key,
    this.isDes = false,
    this.des = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: roboto14().copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.lightColor,
                ),
              ],
            ),
          ),
          isDes
              ? SizedBox(
                  height: 4.h,
                )
              : const SizedBox(),
          isDes
              ? Text(
                  des,
                  style: roboto14(
                      weight: FontWeight.w400, color: AppColors.silverDark),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
