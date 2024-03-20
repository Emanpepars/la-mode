import 'package:flutter/material.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/app_components.dart';

class CuCheckButton extends StatelessWidget {
  final bool isChecked;
  final String title;

  final Function()? onTap;

  const CuCheckButton(
      {required this.isChecked, super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return isChecked
        ? MyButton(
            text: title,
            onPressed: onTap,
            textColor: Colors.white,
            color: AppColors.lightColor,
          )
        : MyButton(
            text: title,
            onPressed: onTap,
            color: AppColors.lightGray,
            borderColor: Colors.transparent,
            textColor: AppColors.lightColor,
          );
  }
}
