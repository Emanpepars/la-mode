import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_ecommerce_app/core/utils/app_images.dart';
import 'package:my_ecommerce_app/core/utils/text_styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:my_ecommerce_app/features/product_details/presentation/pages/product_details_screen.dart';
import 'package:my_ecommerce_app/main_cubit/main_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
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

  static Widget onboardImage({required String onboardImg, bool skip = true}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onboardImg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken, // You can adjust the blend mode
          ),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(150),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 25.w),
      child: Text(
        skip ? "Skip" : "",
        style: roboto16W400(color: Colors.white),
        textAlign: TextAlign.right,
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
                preferredSize: Size.fromHeight(90.h),
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
                                    hintText: "Search",
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
                              onPressed: () {},
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
                                child: const Text("FOR YOU"),
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
                                      text: 'All',
                                      isSelected: currentTabIndex == 0,
                                    ),
                                    TabLabel(
                                      text: 'Women',
                                      isSelected: currentTabIndex == 1,
                                    ),
                                    TabLabel(
                                      text: 'Men',
                                      isSelected: currentTabIndex == 2,
                                    ),
                                    TabLabel(
                                      text: 'Kids',
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
      title: Text(
        appBarTitle,
        style: roboto20(
          weight: FontWeight.w700,
        ),
      ),
      centerTitle: false,
      actions: [
        const BagIcon(bagCount: 4),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
    );
  }
}

class AppBarWithOutBag extends StatelessWidget {
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
        onPressed: () {},
        icon: Icon(leadingIcon, color: AppColors.lightColor),
      ),
      title: Text(
        appBarTitle,
        style: roboto20(
          weight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: IconButton(
            onPressed: () {
              MainCubit.get(context).toggleLanguage(context, "Arabic");
            },
            icon: const NotificationIcon(
              notificationCount: 5,
            ),
          ),
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final Color color;
  final TextStyle? style;
  final String text;
  final Color? textColor;
  final Function()? onPressed;

  const MyButton(
      {required this.text,
      this.color = AppColors.lightColor,
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
          color: AppColors.lightColor,
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
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const ProductDetailsScreen(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
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
                  Image(
                    image: const AssetImage(
                      AppImages.onboard1,
                    ),
                    width: 200.w,
                    height: 120.h,
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
                      "Shirt blouse",
                      style: roboto14(weight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: AppColors.gold,
                        ),
                        Text(
                          "4.5",
                          style: roboto12W400().copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.silverDark),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      "\$39",
                      style:
                          roboto18W500().copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(width: 5.w),
                    const Text(""),
                  ],
                ),
              ],
            ),
            MyYellowButton(text: "Add To Cart", onPressed: () {}),
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
  final Function()? onPressed;
  final String text;

  const MyYellowButton(
      {required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.lightYellow),
      onPressed: onPressed,
      child: Text(
        text,
        style: roboto14(weight: FontWeight.w700),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  final int notificationCount;
  final Function()? onPressed;

  const NotificationIcon({
    this.onPressed,
    required this.notificationCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool showCounter = notificationCount > 0;

    return showCounter
        ? badges.Badge(
            position: badges.BadgePosition.topEnd(
              top: 7.h,
              end: 9.5.w,
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
              onPressed: onPressed,
              icon: SvgPicture.asset(
                AppIcons.notification,
                height: 25.h,
              ),
            ),
          )
        : IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              AppIcons.notification,
              height: 20.h,
            ),
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
