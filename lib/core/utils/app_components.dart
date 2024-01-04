import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/core/utils/text_styles.dart';

import 'app_colors.dart';

class AppComponents {
  static Widget unDefineRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "data",
        ),
      ),
    );
  }

  static Widget onboardImage(String onboardImg) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onboardImg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken, // You can adjust the blend mode
          ),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(150),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 25.w),
      child: Text(
        "Skip",
        style: roboto16W400(color: Colors.white),
        textAlign: TextAlign.right,
      ),
    );
  }

  static Widget myButton(Color? color, TextStyle? style, text) {
    return Container(
      height: 40.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
        ),
        child: Text(
          text,
          style: style ?? roboto18W500(color: Colors.white),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  Color color;
  TextStyle? style;
  String text;
  Color? textColor;
  Function()? onPressed;

  MyButton(
      {required this.text,
      this.color = AppColors.primary,
      this.style,
      this.textColor = Colors.white,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.sp)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: roboto18W500(color: textColor),
        ),
      ),
    );
  }
}
