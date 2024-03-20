import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ProfileRow extends StatelessWidget {
  final String title;
  final int count;
  final Widget rowIcon;
  final Function()? onPressed;

  const ProfileRow({
    super.key,
    required this.title,
    required this.count,
    required this.rowIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                rowIcon,
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style: roboto14().copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                count != 0
                    ? Text(
                        "($count)",
                        style: roboto14().copyWith(fontWeight: FontWeight.w600),
                      )
                    : const SizedBox(),
                SizedBox(
                  width: 10.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.lightColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
