import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class AddressRow extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String? newValue) address;

  const AddressRow({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.white,
      onTap: () {
        address(title);
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                title == "HomeOrder".tr()
                    ? Icons.home_outlined
                    : title == "Work".tr()
                        ? Icons.shopping_bag_outlined
                        : Icons.other_houses_outlined,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                title,
                style: roboto16W500(),
              ),
            ],
          ),
          SizedBox(
            width: 22.w,
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (newValue) {
                address(newValue);
                Navigator.pop(context);
              },
              activeColor: AppColors.gold,
            ),
          ),
        ],
      ),
    );
  }
}
