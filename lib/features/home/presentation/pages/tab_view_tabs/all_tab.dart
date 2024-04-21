import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_images.dart';
import 'package:la_mode/features/category/presentation/pages/category_screen.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_state.dart';
import 'package:la_mode/features/seller/sellers/presentation/pages/sellers_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../widgets/sale_widget.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: HomeCubit.get(context).categoriesAvatar.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0 ||
                          index ==
                              HomeCubit.get(context).categoriesAvatar.length
                      ? SizedBox(width: 10.w)
                      : SizedBox(width: 2.w);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: CategoryScreen(
                          categoryTitle: HomeCubit.get(context)
                              .categoriesAvatar[index]["title"]!,
                        ),
                        withNavBar: true,
                        // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightGray,
                      radius: 45.0,
                      child: Container(
                        height: index == 2
                            ? 45.h
                            : index == 4
                                ? 30.h
                                : index == 5 || index == 6
                                    ? 42.h
                                    : index == 3
                                        ? 50.h
                                        : 38.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: index == 2 || index == 4 ? 1 : 0.4,
                            colorFilter: const ColorFilter.mode(
                                AppColors.lightGray, BlendMode.darken),
                            image: AssetImage(
                              HomeCubit.get(context).categoriesAvatar[index]
                                  ["image"]!,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            HomeCubit.get(context).categoriesAvatar[index]
                                ["title"]!,
                            style: roboto12W400(),
                          ),
                        ),
                      ),
                    ),
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
                      left: 10.w, right: 10.w, top: 20.h, bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryName(title: "Most popular".tr()),
                      const ViewALl(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220.h,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is GetAllProductSuccess) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                          separatorBuilder: (context, index) => ProductCard(
                            dataEntity: HomeCubit.get(context).products[index],
                          ),
                          itemCount: HomeCubit.get(context).products.length,
                        );
                      } else if (HomeCubit.get(context).products.isNotEmpty) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                          separatorBuilder: (context, index) => ProductCard(
                            dataEntity: HomeCubit.get(context).products[index],
                          ),
                          itemCount: HomeCubit.get(context).products.length,
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                          separatorBuilder: (context, index) =>
                              const ProductShimmerCart(),
                          itemCount: 10,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ShopBy(shopBy: "Shop by Brand".tr()),
            ShopBy(
              shopBy: "Shop by Seller".tr(),
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const SellersScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            ShopBy(shopBy: "New Collection".tr()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                  "Find Matching Dresses".tr(),
                  style: roboto20(color: Colors.white),
                )),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryName(title: 'Recommended for you'.tr()),
                      const ViewALl(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220.h,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is GetAllProductSuccess) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                          separatorBuilder: (context, index) => ProductCard(
                            dataEntity: HomeCubit.get(context).products[index],
                          ),
                          itemCount: HomeCubit.get(context).products.length,
                        );
                      } else if (HomeCubit.get(context).products.isNotEmpty) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                          separatorBuilder: (context, index) => ProductCard(
                            dataEntity: HomeCubit.get(context).products[index],
                          ),
                          itemCount: HomeCubit.get(context).products.length,
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                          separatorBuilder: (context, index) =>
                              const ProductShimmerCart(),
                          itemCount: 10,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 20.h, bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryName(title: "Recently viewed".tr()),
                      const ViewALl(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            if (state is GetAllProductSuccess) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                ),
                                separatorBuilder: (context, index) =>
                                    ProductCard(
                                  dataEntity:
                                      HomeCubit.get(context).products[index],
                                ),
                                itemCount:
                                    HomeCubit.get(context).products.length,
                              );
                            } else if (HomeCubit.get(context)
                                .products
                                .isNotEmpty) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                ),
                                separatorBuilder: (context, index) =>
                                    ProductCard(
                                  dataEntity:
                                      HomeCubit.get(context).products[index],
                                ),
                                itemCount:
                                    HomeCubit.get(context).products.length,
                              );
                            } else {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                ),
                                separatorBuilder: (context, index) =>
                                    const ProductShimmerCart(),
                                itemCount: 10,
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 20.h, bottom: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryName(title: 'Collections'.tr()),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 220.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CollectionCard(
                        image: HomeCubit.get(context).collection[index]
                            ["image"]!,
                        text: HomeCubit.get(context).collection[index]["text"]!,
                      ),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 14.w,
                        crossAxisSpacing: 10.h,
                        childAspectRatio: 15.7.w / 19.h,
                      ),
                    ),
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
