import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:la_mode/core/utils/app_images.dart';
import 'package:la_mode/core/utils/text_styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:la_mode/features/filter_page/pages/filtter_screen.dart';
import 'package:la_mode/features/home/domain/entities/prduct_entity.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_state.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/presentation/manager/wishlist_state.dart';
import 'package:la_mode/features/notification/presentation/pages/notification_screen.dart';
import 'package:la_mode/features/product_details/presentation/pages/product_details_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../config/routes.dart';
import '../../features/home/presentation/widgets/tab_label.dart';
import 'app_colors.dart';
import 'app_icons.dart';

class AppComponents {
  static Widget unDefineRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "data",
        ),
      ),
    );
  }

  static Widget myButton(Color? color, TextStyle? style, text) {
    return Container(
      height: 40.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.lightColor,
        ),
        child: Text(
          text,
          style: style ?? roboto18W500(color: Colors.white),
        ),
      ),
    );
  }
}

class FirstPart extends StatelessWidget {
  final String appBarTitle;
  final IconData? leadingIcon;
  final Widget? leading;
  final bool withBag;
  final int currentTabIndex;
  final List<Widget> tabBarView;
  final Function onTabChanged;

  const FirstPart({
    super.key,
    required this.appBarTitle,
    this.leadingIcon = Icons.arrow_back,
    required this.currentTabIndex,
    required this.tabBarView,
    required this.onTabChanged,
    this.withBag = false,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: const SizedBox(),
              backgroundColor: Colors.white,
              floating: true,
              //snap: true,
              //  pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  child: withBag
                      ? AppBarWithBag(
                          appBarTitle: appBarTitle,
                        )
                      : AppBarWithOutBag(
                          appBarTitle: appBarTitle,
                          leadingIcon: leadingIcon,
                        ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.silverM),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: TextField(
                                  cursorColor: AppColors.silverDark,
                                  style: roboto16().copyWith(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 7.h),
                                    hintText: "Search".tr(),
                                    hintStyle: roboto16().copyWith(
                                      color: AppColors.silverDark,
                                    ),
                                    prefixIcon: const Image(
                                      image: AssetImage(
                                        AppIcons.search,
                                      ),
                                      color: AppColors.silverDark,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 1.w, left: 5.w),
                            child: IconButton(
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const FilterScreen(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              icon: Image(
                                image: const AssetImage(AppIcons.filter),
                                color: AppColors.lightColor,
                                width: 30.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: SizedBox(
                        height: 17.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text("FOR YOU".tr()),
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: TabBar(
                                  onTap: (value) {
                                    onTabChanged(value);
                                  },
                                  labelColor: AppColors.gold,
                                  labelStyle: roboto14(),
                                  dividerColor: Colors.transparent,
                                  tabAlignment: TabAlignment.start,
                                  unselectedLabelColor: AppColors.lightColor,
                                  unselectedLabelStyle: roboto12W400(),
                                  indicatorColor: AppColors.gold,
                                  indicatorPadding:
                                      EdgeInsets.only(top: 16.5.h, left: 10.w),
                                  indicator: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: AppColors.gold,
                                  ),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  isScrollable: true,
                                  tabs: [
                                    TabLabel(
                                      text: 'All'.tr(),
                                      isSelected: currentTabIndex == 0,
                                    ),
                                    TabLabel(
                                      text: 'Women'.tr(),
                                      isSelected: currentTabIndex == 1,
                                    ),
                                    TabLabel(
                                      text: 'Men'.tr(),
                                      isSelected: currentTabIndex == 2,
                                    ),
                                    TabLabel(
                                      text: 'Kids'.tr(),
                                      isSelected: currentTabIndex == 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: tabBarView,
        ),
      ),
    );
  }
}

class AppBarWithBag extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const AppBarWithBag({
    super.key,
    required this.appBarTitle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        appBarTitle,
        style: roboto20(
          weight: FontWeight.w700,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.lightColor
              : Colors.white,
        ),
      ),
      centerTitle: false,
      actions: [
        BagIcon(
          bagCount: 4,
          onPressed: () {
            HomeCubit.get(context).controller.index = 1;
            Navigator.pop(context);
          },
        ),
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.more_horiz,
          ),
        )
      ],
    );
  }
}

class AppBarWithOutBag extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final IconData? leadingIcon;

  const AppBarWithOutBag({
    super.key,
    required this.appBarTitle,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(leadingIcon, color: AppColors.lightColor),
      ),
      title: Text(
        appBarTitle,
        style: roboto20(
          weight: FontWeight.w700,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.lightColor
              : Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: const NotificationIcon(
            notificationCount: 5,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyButton extends StatelessWidget {
  final Color color;
  final TextStyle? style;
  final String text;
  final Color? textColor;
  final Color borderColor;

  final Function()? onPressed;

  const MyButton(
      {required this.text,
      this.color = AppColors.lightColor,
      this.borderColor = AppColors.lightColor,
      this.style,
      this.textColor = Colors.white,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
        ),
        child: Text(
          text,
          style: roboto18W500(color: textColor),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductDataEntity dataEntity;

  const ProductCard({required this.dataEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {},
      builder: (context, state) => InkWell(
        onTap: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: ProductDetailsScreen(
              dataEntity: dataEntity,
            ),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Container(
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
                    CachedNetworkImage(
                      width: 200.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                      imageUrl: dataEntity.imageCover ?? "",
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      child: CustomInkWell(
                        onTap: () {
                          WishlistCubit.get(context).addWish(dataEntity.id!);
                        },
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
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          dataEntity.title!,
                          style: roboto14(weight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: AppColors.gold,
                          ),
                          Text(
                            dataEntity.ratingsAverage!.toString(),
                            style: roboto12W400().copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.silverDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${dataEntity.price!}",
                        style: roboto18W500(),
                      ),
                      SizedBox(width: 5.w),
                      const Text(""),
                    ],
                  ),
                ],
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) => CartCubit.get(context)
                        .products
                        .any((product) => product.product!.id == dataEntity.id)
                    ? SizedBox(
                        height: 32.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                CartCubit.get(context).decreaseItemCountCart(
                                    dataEntity.id!,
                                    (CartCubit.get(context)
                                            .products
                                            .where((product) =>
                                                product.product!.id ==
                                                dataEntity.id)
                                            .first
                                            .count!) -
                                        1);
                              },
                              icon: const Icon(
                                Icons.remove,
                              ),
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
                                CartCubit.get(context)
                                    .products
                                    .where((product) =>
                                        product.product!.id == dataEntity.id)
                                    .first
                                    .count
                                    .toString(),
                                style: roboto18W500(),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                CartCubit.get(context).increaseItemCountCart(
                                    dataEntity.id!,
                                    (CartCubit.get(context)
                                            .products
                                            .where((product) =>
                                                product.product!.id ==
                                                dataEntity.id)
                                            .first
                                            .count!) +
                                        1);
                              },
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
                      )
                    : MyYellowButton(
                        text: "Add To Cart".tr(),
                        productId: dataEntity.id!,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardWithSeller extends StatelessWidget {
  final ProductDataEntity dataEntity;

  const ProductCardWithSeller({required this.dataEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: ProductDetailsScreen(
            dataEntity: dataEntity,
          ),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
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
                  CachedNetworkImage(
                    width: 200.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                    imageUrl: dataEntity.imageCover ?? "",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            dataEntity.title!,
                            style: roboto14(
                              weight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${dataEntity.price}",
                              style: roboto18W500(),
                            ),
                            SizedBox(width: 5.w),
                            const Text(""),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 20.sp,
                    backgroundImage: const AssetImage(AppImages.fakeSeller),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: CircleAvatar(
                        backgroundColor: AppColors.gold,
                        radius: 9.sp,
                        child: Icon(
                          Icons.add,
                          color: AppColors.lightColor,
                          size: 14.5.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) => CartCubit.get(context)
                      .products
                      .any((product) => product.product!.id == dataEntity.id)
                  ? SizedBox(
                      height: 32.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              CartCubit.get(context).decreaseItemCountCart(
                                  dataEntity.id!,
                                  (CartCubit.get(context)
                                          .products
                                          .where((product) =>
                                              product.product!.id ==
                                              dataEntity.id)
                                          .first
                                          .count!) -
                                      1);
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
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
                              CartCubit.get(context)
                                  .products
                                  .where((product) =>
                                      product.product!.id == dataEntity.id)
                                  .first
                                  .count
                                  .toString(),
                              style: roboto18W500(),
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              CartCubit.get(context).increaseItemCountCart(
                                  dataEntity.id!,
                                  (CartCubit.get(context)
                                          .products
                                          .where((product) =>
                                              product.product!.id ==
                                              dataEntity.id)
                                          .first
                                          .count!) +
                                      1);
                            },
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
                    )
                  : MyYellowButton(
                      text: "Add To Cart".tr(),
                      productId: dataEntity.id!,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionCard extends StatelessWidget {
  final String text;
  final String image;

  const CollectionCard({required this.text, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(21),
        ),
        border: Border.all(
          color: AppColors.silverM,
        ),
      ),
      child: Container(
        height: 150.h,
        width: 200.w,
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: const ColorFilter.mode(
                  AppColors.silverDark, BlendMode.multiply),
              image: AssetImage(image),
              fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: roboto16W500(color: Colors.white),
        )),
      ),
    );
  }
}

class ShopBy extends StatelessWidget {
  final String shopBy;
  final Function()? onPressed;

  const ShopBy({required this.shopBy, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightGray, elevation: 0),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shopBy,
                  style: roboto14(weight: FontWeight.w500),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.lightColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyYellowButton extends StatelessWidget {
  final String text;
  final String productId;

  const MyYellowButton(
      {required this.text, super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.sp),
        ),
      ),
      onPressed: () {
        CartCubit.get(context).addItemToCart(productId);
      },
      child: Text(
        text,
        style: roboto14(weight: FontWeight.w700),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  final int notificationCount;

  const NotificationIcon({
    required this.notificationCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool showCounter = notificationCount > 0;

    return showCounter
        ? badges.Badge(
            position: badges.BadgePosition.topEnd(
              top: 8.h,
              end: 12.w,
            ),
            badgeAnimation: const badges.BadgeAnimation.slide(
              curve: Curves.decelerate,
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: AppColors.gold,
              // borderSide: BorderSide(color: Colors.white, width: 3.w),
            ),
            badgeContent: const SizedBox(),
            child: IconButton(
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const NotificationScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              icon: SvgPicture.asset(
                AppIcons.notification,
                height: 25.h,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.lightColor
                    : Colors.white,
              ),
            ),
          )
        : IconButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const NotificationScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            icon: SvgPicture.asset(
              AppIcons.notification,
              height: 20.h,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.lightColor
                  : Colors.white,
            ),
          );
  }
}

class ViewALl extends StatelessWidget {
  final void Function()? onTap;

  const ViewALl({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        "View All".tr(),
        style: roboto14(
          weight: FontWeight.w500,
          color: AppColors.gold,
        ).copyWith(
          decoration: TextDecoration.underline,
          decorationColor: AppColors.gold,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ViewButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;

  const ViewButton({this.onTap, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            "View".tr(),
            style: roboto14(
              weight: FontWeight.w500,
              color: AppColors.silverDark,
            ).copyWith(
              decoration: TextDecoration.underline,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            " $title",
            style: roboto14(
              weight: FontWeight.w500,
              color: AppColors.silverDark,
            ).copyWith(
              decoration: TextDecoration.underline,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CategoryName extends StatelessWidget {
  final String title;

  const CategoryName({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: roboto16W500(),
    );
  }
}

class BagIcon extends StatelessWidget {
  final int bagCount;
  final Function()? onPressed;

  const BagIcon({
    this.onPressed,
    required this.bagCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool showCounter = bagCount > 0;

    return showCounter
        ? badges.Badge(
            position: badges.BadgePosition.topEnd(
              top: 0.h,
              end: 4.w,
            ),
            badgeAnimation: const badges.BadgeAnimation.slide(
              curve: Curves.decelerate,
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: AppColors.gold,
            ),
            badgeContent: Text(
              "$bagCount",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
              ),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(
                AppIcons.bag,
                height: 20.h,
              ),
            ),
          )
        : IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              AppIcons.bag,
              height: 20.h,
            ),
          );
  }
}

///--- Alert Dialog ----///
class DoneAlertDialog extends StatelessWidget {
  final String content;
  final Function()? onPressed;

  const DoneAlertDialog({required this.content, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(30.sp),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.done,
              height: 80.h,
              width: 80.w,
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              "Verified!".tr(),
              style: roboto20(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              content,
              style: roboto16W400(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            MyButton(
              text: 'Reset Password'.tr(),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  final int count;
  final String title;

  const Items({required this.count, this.title = "items", super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        textAlign: TextAlign.start,
        "$title ( $count )",
        style: roboto14(color: AppColors.silverDark, weight: FontWeight.w500),
      ),
    );
  }
}

class DrawerRow extends StatelessWidget {
  final Widget icon;
  final String title;
  final void Function()? onTap;

  const DrawerRow({
    required this.icon,
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: roboto14(
              weight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;

  const MyDrawer({super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.sp,
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AppImages.fakeSeller,
                              ),
                            ),
                            border: Border.all(
                              color: AppColors.gold,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                25.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: roboto16W500(),
                          ),
                          Text(
                            userEmail,
                            style: roboto14(weight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                DrawerRow(
                  onTap: () {
                    HomeCubit.get(context).controller.index = 0;
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    color: AppColors.silverDark,
                  ),
                  title: 'Home'.tr(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DrawerRow(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: AppColors.silverDark,
                  ),
                  title: 'Wishlist'.tr(),
                  onTap: () {
                    HomeCubit.get(context).controller.index = 2;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                DrawerRow(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const NotificationScreen(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_none_sharp,
                    color: AppColors.silverDark,
                  ),
                  title: 'Notifications'.tr(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DrawerRow(
                  icon: const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.silverDark,
                  ),
                  title: 'Delivery address'.tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                DrawerRow(
                  icon: const Icon(
                    Icons.payment_outlined,
                    color: AppColors.silverDark,
                  ),
                  title: 'Payment methods'.tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                DrawerRow(
                  icon: const Icon(
                    Icons.insert_drive_file_outlined,
                    color: AppColors.silverDark,
                  ),
                  title: 'About us'.tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                DrawerRow(
                  icon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.silverDark,
                  ),
                  title: 'Contact us'.tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                DrawerRow(
                  icon: const Icon(
                    Icons.info_outline,
                    color: AppColors.silverDark,
                  ),
                  title: 'Help & FAG'.tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            DrawerRow(
              icon: const Icon(
                Icons.logout,
                color: AppColors.silverDark,
              ),
              title: 'Logout'.tr(),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => false,
                );

                HomeCubit.get(context).userBox.deleteAt(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConstAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ConstAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: roboto20(
          weight: FontWeight.w600,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.lightColor
              : Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: const NotificationIcon(
            notificationCount: 5,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomInkWell extends StatelessWidget {
  final Function()? onTap;
  final Widget child;

  const CustomInkWell({this.onTap, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
