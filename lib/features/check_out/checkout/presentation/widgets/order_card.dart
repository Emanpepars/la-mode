import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../home/presentation/pages/bottom_tabs/cart_tab/domain/repositories/product_item.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.items,
  });

  final List<ProductItem> items;

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
                "My Order",
                style: roboto16W500(),
              ),
              Text(
                '\$355',
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
                    Text(
                      items[index].name,
                      style: roboto16W500(
                        color: AppColors.lightColor,
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
                    "Discount",
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
                    "Delivery",
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
                "Total",
                style: roboto16W500(
                  color: AppColors.lightColor,
                ),
              ),
              Text(
                "\$355",
                style: roboto16W500(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
