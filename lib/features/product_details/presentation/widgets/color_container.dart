import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorContainer extends StatelessWidget {
  final int index;
  final Color color;
  final int colorIndex;
  final Function()? onTap;

  const ColorContainer(
      {required this.index,
      required this.color,
      required this.colorIndex,
      super.key,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: colorIndex == index ? const BorderSide() : BorderSide.none,
        ),
      ),
      padding: EdgeInsets.only(bottom: 5.h, top: 7.h),
      child: InkWell(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          width: colorIndex == index ? 42.w : 42.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: colorIndex == index ? color : Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(40.sp)),
            color: color,
          ),
        ),
      ),
    );
  }
}
