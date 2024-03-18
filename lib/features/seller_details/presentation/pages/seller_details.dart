import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_images.dart';
import '../../../../config/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../product_details/presentation/widgets/rating.dart';
import '../../../register/presentation/widgets/social_media.dart';

class SellerDetailsScreen extends StatelessWidget {
  const SellerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBag(
        appBarTitle: "Seller Details",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: SizedBox(
                height: 300.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.sp),
                      ),
                      child: Image.asset(
                        AppImages.findPants,
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w, vertical: 10.h),
                      child: CircleAvatar(
                        backgroundColor: AppColors.gold,
                        radius: 15.sp,
                        child: const Icon(
                          Icons.add,
                          color: AppColors.lightColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Chic Styles - Fashion Store',
                          style: roboto18W500(),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Cairo",
                              style: roboto14(weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  ///-- Social Media ---///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SocialMedia(
                        assetsName: AppIcons.facebook,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      const SocialMedia(
                        assetsName: AppIcons.instagram,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      const SocialMedia(
                        assetsName: AppIcons.googleMap,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  ///---Reviews---///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategoryName(title: "Rating and reviews"),
                      ViewButton(
                        title: "reviews",
                        onTap: () {
                          Navigator.pushNamed(context, Routes.review);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "4.0",
                        style: robotoCustomize(
                          fontSize: 35.sp,
                          fontWeigh: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBarIndicator(
                            rating: 4,
                            unratedColor: AppColors.silverM,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.sp,
                            direction: Axis.horizontal,
                          ),
                          Text(
                            "Based on 210 Reviews",
                            style: roboto14(
                              weight: FontWeight.w400,
                              color: AppColors.silverDark,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    children: [
                      const CuRatingBar(
                        value: 4 / 5,
                        text: 'Excellent',
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const CuRatingBar(
                        value: 3 / 5,
                        text: 'Good',
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const CuRatingBar(
                        value: 2 / 5,
                        text: 'Average',
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const CuRatingBar(
                        value: 1 / 5,
                        text: 'Below Average',
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const CuRatingBar(
                        value: 0 / 5,
                        text: 'Poor',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),

                  ///---Working hours---///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategoryName(title: "Working hours"),

                      ///--- Closed ---///
                      Text(
                        "Currently closed",
                        style: roboto14(
                          weight: FontWeight.w600,
                          color: AppColors.red,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From Saturday to Thursday",
                        style: roboto14(),
                      ),
                      Text(
                        "10 am- 12 pm",
                        style: roboto14(
                          color: AppColors.silverDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Friday",
                        style: roboto14(),
                      ),
                      Text(
                        "Closed",
                        style: roboto14(
                          color: AppColors.silverDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  ///--- Products ---///
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: const CategoryName(
                            title: "Products",
                          )),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => const ProductCard(),
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.h,
                          mainAxisSpacing: 10.w,
                          childAspectRatio: 2.w / 2.66.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
