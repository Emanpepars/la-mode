import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/features/product_details/presentation/manager/product_details_cubit.dart';
import 'package:la_mode/features/product_details/presentation/manager/product_details_state.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/text_styles.dart';
import '../widgets/color_container.dart';
import '../widgets/property_button.dart';
import '../widgets/rating.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductDetailsCubit(),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: const AppBarWithBag(
            appBarTitle: "Product Details",
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: SizedBox(
                    height: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.sp),
                      ),
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: ProductDetailsCubit.get(context)
                            .flashSalePageController,
                        onPageChanged: (value) {
                          ProductDetailsCubit.get(context).onPageChanged(value);
                        },
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ProductDetailsCubit.get(context)
                                  .sales[index]["image"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.sp),
                                    ),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.h,
                                    horizontal: 6.w,
                                  ),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 24.sp,
                                    color: AppColors.lightColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount:
                            ProductDetailsCubit.get(context).sales.length,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w, vertical: 10.h),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          ProductDetailsCubit.get(context).onPageChanged(index);
                          ProductDetailsCubit.get(context)
                              .flashSalePageController
                              .animateToPage(index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: Container(
                          width: ProductDetailsCubit.get(context)
                                      .currentFlashSalePageIndex ==
                                  index
                              ? 110.w
                              : 110.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ProductDetailsCubit.get(context)
                                            .currentFlashSalePageIndex ==
                                        index
                                    ? AppColors.gold
                                    : Colors.white,
                                width: 2.w),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                            image: DecorationImage(
                              image: AssetImage(ProductDetailsCubit.get(context)
                                  .sales[index]["image"]!),
                              fit: BoxFit.cover,
                              opacity: 0.9,
                            ),
                          ),
                        ),
                      ),
                      itemCount: ProductDetailsCubit.get(context).sales.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: 5.w,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              ProductDetailsCubit.get(context).sales[0]
                                  ["title"]!,
                              style: roboto18W500(),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "\$${ProductDetailsCubit.get(context).sales[0]["price"]!}",
                              style: roboto18W500(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Available in stock",
                        style: roboto16(
                          color: AppColors.lightColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      ///--brand --///
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.gold),
                              borderRadius: BorderRadius.all(
                                Radius.circular(26.sp),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 26.sp,
                              backgroundImage:
                                  const AssetImage(AppImages.fakeSeller),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.gold,
                                  radius: 12.sp,
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 205.w,
                                    child: Text(
                                      "Gucci-Bubble Store",
                                      style: roboto16W500(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const ViewButton(title: "seller"),
                                ],
                              ),
                              Text(
                                "Alexandria,Egypt",
                                style: roboto14(
                                  color: AppColors.silverDark,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      ///---Description---///
                      const CategoryName(title: "Description"),
                      ReadMoreText(
                        ProductDetailsCubit.get(context).sales[0]
                            ["description"]!,
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Read less',
                        moreStyle: roboto14(
                          color: AppColors.lightColor,
                        ),
                        lessStyle: roboto14(
                          color: AppColors.lightColor,
                        ),
                        style: roboto14(
                          color: AppColors.silverDark,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///---Sizes---///
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CategoryName(title: "Available sizes"),
                              Text(
                                "Size guide",
                                style: roboto14(
                                  weight: FontWeight.w500,
                                  color: AppColors.silverDark,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 45.h,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: ProductDetailsCubit.get(context)
                                    .sizes
                                    .length,
                                itemBuilder: (context, index) {
                                  return PropertyButton(
                                    color: ProductDetailsCubit.get(context)
                                                .sizeSelectedIndex ==
                                            index
                                        ? AppColors.lightColor
                                        : AppColors.lightGray,
                                    text: ProductDetailsCubit.get(context)
                                        .sizes[index],
                                    onTap: () {
                                      ProductDetailsCubit.get(context)
                                          .onSizeTap(index);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///---Colors---///
                      const CategoryName(title: "Colors"),
                      SizedBox(
                        height: 50.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              ProductDetailsCubit.get(context).colors.length,
                          itemBuilder: (context, index) {
                            return ColorContainer(
                              onTap: () {
                                ProductDetailsCubit.get(context)
                                    .onColorTap(index);
                              },
                              index: index,
                              color: ProductDetailsCubit.get(context)
                                  .colors[index],
                              colorIndex:
                                  ProductDetailsCubit.get(context).colorIndex,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            width: 5.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
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

                      ///---Match with---///
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryName(title: "Match with this"),
                                ViewALl(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 220.h,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          index == 0
                                              ? SizedBox(
                                                  width: 0.w,
                                                )
                                              : SizedBox(
                                                  width: 5.w,
                                                ),
                                      separatorBuilder: (context, index) =>
                                          const ProductCard(),
                                      itemCount: 6),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      ///---Recently Viewed---///
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryName(title: "Recently viewed"),
                                ViewALl(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 220.h,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          index == 0
                                              ? SizedBox(
                                                  width: 0.w,
                                                )
                                              : SizedBox(
                                                  width: 5.w,
                                                ),
                                      separatorBuilder: (context, index) =>
                                          const ProductCard(),
                                      itemCount: 6),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25.sp),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.h,
                      child: const MyButton(
                        text: "Add To Bag",
                        textColor: AppColors.lightColor,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50.h,
                      child: const MyButton(
                        text: "Buy Now",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
