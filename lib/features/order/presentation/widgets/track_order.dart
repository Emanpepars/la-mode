import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/order/domain/entities/order_item.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({
    super.key,
    required this.order,
  });

  final OrderItem order;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${order.orderNumber}",
                    style: roboto16W500(),
                  ),
                  Text(
                    '\$${order.price}',
                    style: roboto16W500(),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  order.state == "Shipping"
                      ? Text(
                          order.state,
                          style: roboto14(
                              color: AppColors.gold, weight: FontWeight.w500),
                        )
                      : order.state == "Delivered"
                          ? Text(
                              order.state,
                              style: roboto14(
                                  color: Colors.green, weight: FontWeight.w500),
                            )
                          : order.state == "Canceled"
                              ? Text(
                                  order.state,
                                  style: roboto14(
                                      color: AppColors.red,
                                      weight: FontWeight.w500),
                                )
                              : Text(
                                  order.state,
                                  style: roboto14(
                                      color: AppColors.silverDark,
                                      weight: FontWeight.w500),
                                ),
                  Text(
                    DateFormat('MMM dd,yyyy \'at\' h:mm a').format(order.date),
                    style: roboto14(
                        color: AppColors.silverDark, weight: FontWeight.w500),
                  ),
                ],
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
                      width: 250.w,
                      child: Text(
                        order.items[index].product!.title!,
                        style: roboto16W500(
                          color: AppColors.lightColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "\$${order.items[index].price!}",
                      style: roboto16W500(),
                    ),
                  ],
                ),
                itemCount: order.items.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 2.h,
                ),
              ),

              ///--- Discount ---///
              order.discount == 0
                  ? const SizedBox()
                  : Column(
                      children: [
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
                              "-\$${order.discount}",
                              style: roboto16W500(
                                color: AppColors.silverDark,
                              ),
                            ),
                          ],
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
                    "\$${order.delivery}",
                    style: roboto16W500(
                      color: AppColors.silverDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 20.h,
            thickness: 1,
            color: AppColors.lightGray,
          ),
          Column(
            children: [
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
                    "\$${order.price}",
                    style: roboto16W500(),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              order.state == "Shipping" || order.state == "Pending"
                  ? MyButton(
                      text: 'Track Order'.tr(),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.trackOrder,
                          arguments: {
                            'placed': order.placed,
                            'shipped': order.shipped,
                            'pickedUp': order.pickedUp,
                            'delivered': order.delivered,
                            'price': order.price,
                            'clock': DateFormat('h:mm a').format(order.date),
                          },
                        );
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.repeat_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Repeat order".tr(),
                              style: roboto14(color: AppColors.silverDark)
                                  .copyWith(
                                      decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        order.state == "Canceled"
                            ? const SizedBox()
                            : Text(
                                "Leave a review",
                                style: roboto14(color: AppColors.silverDark)
                                    .copyWith(
                                        decoration: TextDecoration.underline),
                              ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
