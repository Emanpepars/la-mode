import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

TextStyle roboto20(
        {FontWeight? weight = FontWeight.w600,
        Color? color = AppColors.lightColor}) =>
    GoogleFonts.roboto(fontSize: 20.sp, fontWeight: weight, color: color);

TextStyle roboto14W300({Color? color = AppColors.lightColor}) =>
    GoogleFonts.roboto(
        fontSize: 14.sp, fontWeight: FontWeight.w300, color: color);

TextStyle roboto14(
        {Color? color = AppColors.lightColor,
        FontWeight? weight = FontWeight.w400}) =>
    GoogleFonts.roboto(fontSize: 14.sp, fontWeight: weight, color: color);

TextStyle roboto16W400({Color? color = AppColors.lightColor}) =>
    GoogleFonts.roboto(
        fontSize: 16.sp, fontWeight: FontWeight.w400, color: color);

TextStyle roboto16W500({Color? color = AppColors.lightColor}) =>
    GoogleFonts.roboto(
        fontSize: 16.sp, fontWeight: FontWeight.w500, color: color);

TextStyle roboto16({Color? color = AppColors.lightColor}) =>
    GoogleFonts.roboto(fontSize: 16.sp, color: color);

TextStyle roboto12W400({Color? color = AppColors.lightColor}) =>
    GoogleFonts.roboto(
        fontSize: 12.sp, fontWeight: FontWeight.w400, color: color);

TextStyle roboto18W500(
        {Color? color = AppColors.lightColor,
        FontWeight? fontWeight = FontWeight.w500}) =>
    GoogleFonts.roboto(fontSize: 18.sp, fontWeight: fontWeight, color: color);

TextStyle roboto8W400({Color? color = AppColors.lightColor}) =>
    GoogleFonts.roboto(
        fontSize: 8.sp, fontWeight: FontWeight.w400, color: color);

TextStyle robotoCustomize(
        {Color? color = AppColors.lightColor,
        double? fontSize = 16,
        FontWeight? fontWeigh = FontWeight.w500}) =>
    GoogleFonts.roboto(fontSize: fontSize, fontWeight: fontWeigh, color: color);

TextStyle robotoTitleField() => GoogleFonts.roboto(
    fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.lightColor);
