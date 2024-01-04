import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

TextStyle roboto20W600() => GoogleFonts.roboto(
    fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColors.primary);

TextStyle roboto14W300({Color color = AppColors.primary}) => GoogleFonts.roboto(
    fontSize: 14.sp, fontWeight: FontWeight.w300, color: color);

TextStyle roboto16W400({Color? color = AppColors.primary}) => GoogleFonts.roboto(
    fontSize: 16.sp, fontWeight: FontWeight.w400, color: color);

TextStyle roboto12W400() => GoogleFonts.roboto(
    fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.primary);

TextStyle roboto18W500({Color? color = AppColors.primary}) =>
    GoogleFonts.roboto(
        fontSize: 18.sp, fontWeight: FontWeight.w500, color: color);
