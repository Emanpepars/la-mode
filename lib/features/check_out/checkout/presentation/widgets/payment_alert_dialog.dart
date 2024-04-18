import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';

class PaymentAlertDialog extends StatelessWidget {
  const PaymentAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              25.sp,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.done,
              height: 100.h,
              width: 80.w,
            ),
            Text(
              "Order Placed!".tr(),
              style: roboto16W500(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Your order #$ORDER_ID was placed successfully. You can see the status of your order at any time.",
              style: roboto14(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            MyButton(
              text: 'Track Your Order'.tr(),
              onPressed: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            MyButton(
              color: Colors.white,
              textColor: AppColors.lightColor,
              text: 'Back To Home'.tr(),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.home,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
