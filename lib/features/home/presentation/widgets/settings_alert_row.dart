import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class SettingsAlertRow extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String? newValue) function;

  const SettingsAlertRow({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      splashColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      onTap: () {
        function(title);
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: roboto16W500(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.lightColor
                  : Colors.white,
            ),
          ),
          SizedBox(
            width: 22.w,
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (newValue) {
                function(newValue);
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
