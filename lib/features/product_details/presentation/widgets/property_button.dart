import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/core/utils/app_colors.dart';
import 'package:my_ecommerce_app/core/utils/text_styles.dart';

class PropertyButton extends StatelessWidget {
  final Color color;
  final String text;
  final bool isAvailable;
  final Function()? onTap;

  const PropertyButton({
    required this.color,
    required this.text,
    this.isAvailable = true,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 28.sp,
        backgroundColor: color,
        child: Text(
          text,
          style: roboto16W500(
            color: isAvailable
                ? color == AppColors.lightColor
                    ? Colors.white
                    : Colors.black
                : AppColors.silverM,
          ),
        ),
      ),
    );
  }
}
