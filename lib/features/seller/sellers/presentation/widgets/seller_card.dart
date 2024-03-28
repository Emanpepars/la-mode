import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/seller/seller_details/presentation/pages/seller_details.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';

class SellerCard extends StatelessWidget {
  final String userName;
  final double rate;

  final String location;

  final bool isOpen;

  const SellerCard({
    super.key,
    required this.userName,
    required this.rate,
    required this.location,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.silverM,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: const AssetImage(
                    AppImages.onboard1,
                  ),
                  width: 200.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: CircleAvatar(
                    radius: 12.sp,
                    backgroundColor: AppColors.gold,
                    child: Icon(
                      Icons.add,
                      size: 20.sp,
                      color: AppColors.lightColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    userName,
                    style: roboto14(weight: FontWeight.w600),
                  ),
                  InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const SellerDetailsScreen(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              RatingBarIndicator(
                rating: rate,
                unratedColor: AppColors.silverM,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 18.sp,
                direction: Axis.horizontal,
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.silverDark,
                      ),
                      SizedBox(
                        width: 60.w,
                        child: Text(
                          maxLines: 1,
                          location,
                          style: robotoCustomize(
                            fontWeigh: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.silverDark,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  isOpen
                      ? Row(
                          children: [
                            CircleAvatar(
                              radius: 4.sp,
                              backgroundColor: Colors.green,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "Open",
                              style: robotoCustomize(
                                fontWeigh: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            CircleAvatar(
                              radius: 4.sp,
                              backgroundColor: AppColors.red,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "Closed",
                              style: robotoCustomize(
                                fontWeigh: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
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
