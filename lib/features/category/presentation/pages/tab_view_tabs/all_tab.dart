import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_images.dart';
import 'package:la_mode/features/category/presentation/manager/category_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../widgets/sort_alert_dialog.dart';
import '../../../../seller/sellers/presentation/pages/sellers_screen.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      CategoryCubit.get(context).products.length.toString(),
                      style: roboto14(
                          weight: FontWeight.w400, color: AppColors.silverDark),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "items found".tr(),
                      style: roboto14(
                          weight: FontWeight.w400, color: AppColors.silverDark),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Sort by".tr(),
                      style: roboto12W400(color: AppColors.silverDark),
                    ),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const SortCatDialog();
                            },
                          );
                        },
                        child: const Icon(Icons.keyboard_arrow_down))
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, bottom: 10.h, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryName(title: "Recommended for you".tr()),
                    const ViewALl(),
                  ],
                ),
              ),
              SizedBox(
                height: 220.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    width: 10.w,
                  ),
                  separatorBuilder: (context, index) => ProductCard(
                    dataEntity: CategoryCubit.get(context).products[index],
                  ),
                  itemCount: CategoryCubit.get(context).products.length,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Container(
              width: double.infinity,
              height: 150.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.grey, BlendMode.multiply),
                  image: AssetImage(AppImages.findPants),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                  child: Text(
                "Find Your Own Jeans".tr(),
                style: roboto20(color: Colors.white),
              )),
            ),
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
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    width: 10.w,
                  ),
                  separatorBuilder: (context, index) => ProductCard(
                    dataEntity: CategoryCubit.get(context).products[index + 3],
                  ),
                  itemCount: (CategoryCubit.get(context).products.length - 3),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
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
          GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6.6.h / 10.h,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ProductCard(
              dataEntity: CategoryCubit.get(context).products[index],
            ),
            itemCount: CategoryCubit.get(context).products.length,
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
