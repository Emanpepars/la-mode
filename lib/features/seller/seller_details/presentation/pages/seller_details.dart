import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_images.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/seller/seller_details/presentation/manager/seller_details_cubit.dart';
import 'package:la_mode/features/seller/seller_details/presentation/manager/seller_details_states.dart';
import '../../../../../config/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../auth/register/presentation/widgets/social_media.dart';
import '../../../../product_details/presentation/widgets/rating.dart';

class SellerDetailsScreen extends StatelessWidget {
  const SellerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SellerDetailsCubit(),
      child: BlocConsumer<SellerDetailsCubit, SellerDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBarWithBag(
            appBarTitle: "Seller Details".tr(),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
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
                          CategoryName(title: "Rating and reviews".tr()),
                          ViewButton(
                            title: "reviews".tr(),
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
                          CuRatingBar(
                            value: 4 / 5,
                            text: 'Excellent'.tr(),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CuRatingBar(
                            value: 3 / 5,
                            text: 'Good'.tr(),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CuRatingBar(
                            value: 2 / 5,
                            text: 'Average'.tr(),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CuRatingBar(
                            value: 1 / 5,
                            text: 'Below Average'.tr(),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CuRatingBar(
                            value: 0 / 5,
                            text: 'Poor'.tr(),
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
                          CategoryName(title: "Working hours".tr()),

                          ///--- Closed ---///
                          Text(
                            "Currently closed".tr(),
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
                            "Closed".tr(),
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
                      CategoryName(title: 'Brands'.tr()),
                      SizedBox(
                        height: 5.h,
                      ),
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 4.h,
                        children:
                            SellerDetailsCubit.get(context).brands.map((brand) {
                          return GestureDetector(
                            child: Text(
                              brand,
                              style: roboto14(color: AppColors.silverDark)
                                  .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          );
                        }).toList(),
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
                              child: CategoryName(
                                title: "Products".tr(),
                              )),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                ProductCardWithSeller(
                              dataEntity:
                                  HomeCubit.get(context).products[index],
                            ),
                            itemCount: HomeCubit.get(context).products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
          drawer: const MyDrawer(
            userName: '',
            userEmail: '',
          ),
        ),
      ),
    );
  }
}
