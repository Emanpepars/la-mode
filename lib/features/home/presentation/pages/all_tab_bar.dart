import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/core/utils/app_images.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/text_styles.dart';
import '../widgets/sale_widget.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 60.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? SizedBox(width: 20.w)
                    : SizedBox(width: 2.w);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const CircleAvatar(
                  backgroundColor: AppColors.lightGray,
                  radius: 35.0,
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const FlashSale(),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 25.w, right: 25.w, top: 20.h, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most popular",
                      style: roboto14(weight: FontWeight.w500),
                    ),
                    Text(
                      "View all",
                      style: roboto12W400(color: AppColors.gold),
                    ),
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
                          itemBuilder: (context, index) => index == 0
                              ? SizedBox(
                                  width: 25.w,
                                )
                              : SizedBox(
                                  width: 10.w,
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
          const ShopBy(shopBy: "Shop by Brand"),
          const ShopBy(shopBy: "Shop by Seller"),
          const ShopBy(shopBy: "New Collection"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Container(
              width: double.infinity,
              height: 300.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.grey, BlendMode.multiply),
                  image: AssetImage(AppImages.findMatchingDress),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                  child: Text(
                "Find Matching Dresses",
                style: roboto20(color: Colors.white),
              )),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 25.w, right: 25.w, top: 10.h, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended for you",
                      style: roboto14(weight: FontWeight.w500),
                    ),
                    Text(
                      "View all",
                      style: roboto12W400(color: AppColors.gold),
                    ),
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
                          itemBuilder: (context, index) => index == 0
                              ? SizedBox(
                                  width: 25.w,
                                )
                              : SizedBox(
                                  width: 10.w,
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 25.w, right: 25.w, top: 20.h, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recently viewed",
                      style: roboto14(weight: FontWeight.w500),
                    ),
                    Text(
                      "View all",
                      style: roboto12W400(color: AppColors.gold),
                    ),
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
                          itemBuilder: (context, index) => index == 0
                              ? SizedBox(
                                  width: 25.w,
                                )
                              : SizedBox(
                                  width: 10.w,
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
          Padding(
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Collections",
                  style: roboto14(weight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 220.h,
                  width: 800.w,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CollectionCard(image: homeProvider.collection[index]["image"]!, text: homeProvider.collection[index]["text"]!,),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 17.w / 19.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
