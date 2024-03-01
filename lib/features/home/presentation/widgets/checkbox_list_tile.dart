import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CuCheckboxListTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(String)? onChanged;

  const CuCheckboxListTile(
      {required this.title, this.value = false, this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.sp))),
      activeColor: AppColors.gold,
      title: Text(title),
      value: value,
      onChanged: (value) {
        onChanged;
      },
    );
  }
}
