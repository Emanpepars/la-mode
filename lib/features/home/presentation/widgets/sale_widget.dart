import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_state.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: 340.w,
        height: 145.h,
        decoration: const BoxDecoration(
          color: AppColors.lightColor,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      "FLASH SALE!",
                      style: roboto18W500(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    height: 20.h,
                    width: 128.w,
                    decoration: const BoxDecoration(
                      color: AppColors.silverDark,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
                    child: Text(
                      HomeCubit.get(context).sales[HomeCubit.get(context)
                          .currentFlashSalePageIndex]["title"]!,
                      style: roboto14(
                          color: Colors.white, weight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: SizedBox(
                      width: 135.w,
                      child: Text(
                        HomeCubit.get(context).sales[HomeCubit.get(context)
                            .currentFlashSalePageIndex]["description"]!,
                        style: roboto12W400(
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 5.w),
                          height: 5.h,
                          width: HomeCubit.get(context)
                                      .currentFlashSalePageIndex ==
                                  index
                              ? 40.w
                              : 15.w,
                          decoration: BoxDecoration(
                            color: HomeCubit.get(context)
                                        .currentFlashSalePageIndex ==
                                    index
                                ? AppColors.gold
                                : AppColors.silverM,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(150),
                  bottomLeft: Radius.circular(150),
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: PageView.builder(
                  controller: HomeCubit.get(context).flashSalePageController,
                  onPageChanged: (value) {
                    HomeCubit.get(context).onPageChanged(value);
                  },
                  itemBuilder: (BuildContext context, int index) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            HomeCubit.get(context).sales[index]["image"]!),
                        fit: BoxFit.cover,
                        opacity: 0.3,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.gold,
                            radius: 16,
                            child: Text(
                              "Get",
                              style: roboto12W400(color: Colors.black),
                            ),
                          ),
                          SizedBox(height: 22.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                HomeCubit.get(context).sales[index]
                                    ["discount"]!,
                                style: roboto20(color: Colors.white),
                              ),
                              Text(
                                "% Discount",
                                style: roboto16W500(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: HomeCubit.get(context).sales.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
