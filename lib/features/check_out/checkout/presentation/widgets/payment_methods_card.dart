import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class PaymentMethod extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(BuildContext context, String? newValue) paymentMethods;

  const PaymentMethod({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.paymentMethods,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.white,
      onTap: () {
        paymentMethods(context, title);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: roboto16W500(),
          ),
          SizedBox(
            width: 22.w,
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (newValue) {
                paymentMethods(context, newValue);
              },
              activeColor: AppColors.gold,
            ),
          ),
        ],
      ),
    );
  }
}
