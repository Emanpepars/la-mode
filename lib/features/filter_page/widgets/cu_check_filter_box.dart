import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/text_styles.dart';
import '../../category/presentation/widgets/sort_alert_dialog.dart';

class CustomCheckbox extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function()? onTap;

  const CustomCheckbox(
      {super.key, required this.title, required this.isChecked, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0.h),
      child: Row(
        children: [
          CuCheckBox(
            isChecked: isChecked,
            onTap: onTap,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: roboto16W500(),
          ),
        ],
      ),
    );
  }
}
