import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/text_styles.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_images.dart';

class BagItem extends StatelessWidget {
  const BagItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.silverM,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            12.sp,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      height: 110.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: const AssetImage(
                      AppImages.onboard1,
                    ),
                    width: 100.w,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.lightGray,
                      child: Image(
                        image: const AssetImage(
                          AppIcons.heart,
                        ),
                        color: AppColors.lightColor,
                        width: 15.w,
                        height: 15.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cotton Hoddie',
                            style: roboto14(weight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            width: 140.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Size: ',
                                      style: roboto12W400().copyWith(
                                        color: AppColors.silverDark,
                                      ),
                                    ),
                                    Text(
                                      'XL',
                                      style: roboto12W400().copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Color: ',
                                      style: roboto12W400().copyWith(
                                        color: AppColors.silverDark,
                                      ),
                                    ),
                                    Text(
                                      'Black',
                                      style: roboto12W400().copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '\$150',
                    style: roboto16W500().copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 129.w,
                        child: Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.lightYellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13.w),
                              child: Text(
                                "1",
                                style: roboto18W500(),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.lightYellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '\$35',
                            style: roboto12W400().copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.silverDark,
                            ),
                          ),
                          Text(
                            '-5%',
                            style: roboto12W400().copyWith(
                              color: AppColors.silverDark,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
