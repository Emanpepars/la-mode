import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/routes.dart';
import '../../../core/utils/text_styles.dart';

class OnboardImage extends StatelessWidget {
  final String onboardImg;
  final bool skip;

  const OnboardImage({this.skip = true, super.key, required this.onboardImg});

  @override
  Widget build(BuildContext context) {
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
      ),
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 25.w),
      child: InkWell(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.login,
            (routes) => false,
          );
        },
        child: Text(
          skip ? "Skip" : "",
          style: roboto16W400(color: Colors.white),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
