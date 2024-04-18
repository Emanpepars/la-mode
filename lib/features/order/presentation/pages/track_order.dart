import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/core/utils/text_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/dashed_divider.dart';

class TrackOrderScreen extends StatelessWidget {
  final bool placed;
  final bool shipped;
  final bool pickedUp;
  final bool delivered;
  final String clock;
  final int price;

  const TrackOrderScreen({
    super.key,
    required this.price,
    required this.clock,
    required this.placed,
    required this.shipped,
    required this.pickedUp,
    required this.delivered,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBag(
        appBarTitle: "Track Order".tr(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGray,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.sp,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  delivered
                      ? "100%"
                      : pickedUp
                          ? "75%"
                          : shipped
                              ? "50%"
                              : placed
                                  ? "25%"
                                  : "",
                  style: roboto14(weight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    minHeight: 8.h,
                    value: delivered
                        ? 100 / 100
                        : pickedUp
                            ? 75 / 100
                            : shipped
                                ? 50 / 100
                                : placed
                                    ? 25 / 100
                                    : 0 / 100,
                    color: AppColors.gold,
                    backgroundColor: AppColors.lightGray,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        4.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                ///--- Placed ---///
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.gold,
                      radius: 8.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Order is placed'.tr(),
                      style: roboto16W500(),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: const DashedDivider(
                        color: AppColors.gold,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.silverDark,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            clock,
                            style: roboto14(
                              color: AppColors.silverDark,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                ///--- Shipped ---///
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          shipped ? AppColors.gold : AppColors.silverDark,
                      radius: 8.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Order is Shipped'.tr(),
                      style: roboto16W500(),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DashedDivider(
                        color: placed
                            ? shipped
                                ? AppColors.gold
                                : AppColors.silverDark
                            : AppColors.silverM,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text(
                        'Captain is picking your order'.tr(),
                        style: roboto14(
                          color: AppColors.silverDark,
                          weight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),

                ///--- picked Up ---///
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: shipped
                          ? pickedUp
                              ? AppColors.gold
                              : AppColors.silverDark
                          : AppColors.silverM,
                      radius: 8.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Order is picked up'.tr(),
                      style: roboto16W500(),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DashedDivider(
                        color: pickedUp ? AppColors.gold : AppColors.silverM,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text(
                        "Captain is on his way".tr(),
                        style: roboto14(
                          color: AppColors.silverDark,
                          weight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),

                ///--- Delivered ---///
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: pickedUp
                          ? delivered
                              ? AppColors.gold
                              : AppColors.silverDark
                          : AppColors.silverM,
                      radius: 8.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Order is Delivered',
                      style: roboto16W500(),
                    )
                  ],
                ),
              ],
            ),
            Divider(
              height: 20.h,
              thickness: 1,
              color: AppColors.lightGray,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: roboto16W500(
                    color: AppColors.lightColor,
                  ),
                ),
                Text(
                  "\$$price",
                  style: roboto16W500(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
