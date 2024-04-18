import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/main_cubit/main_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class SettingsAlertRow extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String? newValue) address;

  const SettingsAlertRow({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.white,
      onTap: () {
        MainCubit.get(context).toggleLanguage(context, value);
        address(title);
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: roboto16W500(),
          ),
          SizedBox(
            width: 22.w,
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (newValue) {
                address(newValue);
                Navigator.pop(context);
              },
              activeColor: AppColors.gold,
            ),
          ),
        ],
      ),
    );
  }
}
