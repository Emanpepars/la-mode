import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class MyYellowButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const MyYellowButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.lightYellow),
      onPressed: onPressed,
      child: Text(
        text,
        style: roboto14(weight: FontWeight.w700),
      ),
    );
  }
}
