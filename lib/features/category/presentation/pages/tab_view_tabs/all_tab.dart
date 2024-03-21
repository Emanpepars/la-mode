import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_images.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../widgets/sort_alert_dialog.dart';
import '../../../../sellers/presentation/pages/sellers_screen.dart';

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
                Text(
                  "1250 items found",
                  style: roboto14(
                      weight: FontWeight.w400, color: AppColors.silverDark),
                ),
                Row(
                  children: [
                    Text(
                      "Sort by",
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryName(title: "Recommended for you"),
                    ViewALl(),
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
                  separatorBuilder: (context, index) => const ProductCard(),
                  itemCount: 6,
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
                "Find Your Own Jeans",
                style: roboto20(color: Colors.white),
              )),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 20.h, bottom: 10.h),
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
                        itemBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        separatorBuilder: (context, index) =>
                            const ProductCard(),
                        itemCount: 6,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
          const ShopBy(shopBy: "Shop by Brand"),
          ShopBy(
            shopBy: "Shop by Seller",
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const SellersScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
          const ShopBy(shopBy: "New Collection"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 6.6.h / 10.h,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w),
              itemBuilder: (BuildContext context, int index) =>
                  const ProductCardWithSeller(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
