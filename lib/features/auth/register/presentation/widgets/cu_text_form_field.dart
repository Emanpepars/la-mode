import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_colors.dart';

import '../../../../../core/utils/text_styles.dart';


class CuTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CuTextFormField(
      {required this.hintText,
      super.key,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      scrollPadding: EdgeInsets.zero,
      cursorColor: AppColors.silverDark,
      style: roboto16().copyWith(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        iconColor: AppColors.silverDark,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        hintText: hintText,
        hintStyle: robotoTitleField().copyWith(color: AppColors.silverDark),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.sp),
          borderSide: BorderSide(
            color: AppColors.silverM,
            width: 1.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.sp),
          borderSide: const BorderSide(
            color: AppColors.silverM,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.sp),
          borderSide: const BorderSide(
            color: AppColors.silverM,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
