import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/entities/cart_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.items,
  });

  final List<CartProducts> items;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Order".tr(),
                style: roboto16W500(),
              ),
              Text(
                "\$${CartCubit.get(context).totalCartPrice}",
                style: roboto16W500(),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Divider(
            height: 10.h,
            thickness: 1,
            color: AppColors.lightGray,
          ),
          SizedBox(
            height: 8.h,
          ),
          Column(
            children: [
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 260.w,
                      child: Text(
                        items[index].product!.title!,
                        style: roboto16W500(
                          color: AppColors.lightColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "\$${items[index].price}",
                      style: roboto16W500(),
                    ),
                  ],
                ),
                itemCount: items.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 2.h,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount".tr(),
                    style: roboto16W500(
                      color: AppColors.silverDark,
                    ),
                  ),
                  Text(
                    "-\$10",
                    style: roboto16W500(
                      color: AppColors.silverDark,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery".tr(),
                    style: roboto16W500(
                      color: AppColors.silverDark,
                    ),
                  ),
                  Text(
                    "\$5",
                    style: roboto16W500(
                      color: AppColors.silverDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 15.h,
            thickness: 1,
            color: AppColors.lightGray,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total".tr(),
                style: roboto16W500(
                  color: AppColors.lightColor,
                ),
              ),
              Text(
                "\$${CartCubit.get(context).totalCartPrice}",
                style: roboto16W500(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
