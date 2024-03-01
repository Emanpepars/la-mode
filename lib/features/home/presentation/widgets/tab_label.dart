import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class TabLabel extends StatelessWidget {
  final bool isSelected;
  final String text;

  const TabLabel({required this.text, this.isSelected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Row(
            children: [
              CircleAvatar(
                radius: 3.sp,
                backgroundColor: AppColors.gold,
              ),
              SizedBox(
                width: 5.w,
              ),
              Tab(text: text),
            ],
          )
        : Tab(text: text);
  }
}
