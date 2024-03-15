import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../pages/bottom_tabs/cart_tab.dart';
import '../../pages/bottom_tabs/fav_tab.dart';
import '../../pages/bottom_tabs/home_tab_bar.dart';
import '../../pages/bottom_tabs/profile_tab.dart';
import '../../pages/bottom_tabs/settings_tab.dart';
import '../../pages/tab_view_tabs/all_tab.dart';
import '../../pages/tab_view_tabs/kids_tab_bar.dart';
import '../../pages/tab_view_tabs/men_tab_bar.dart';
import '../../pages/tab_view_tabs/women_tab_bar.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late Timer timer;

  HomeCubit() : super(HomeInitial()) {
    timer = Timer.periodic(const Duration(milliseconds: 50000000), (timer) {
      nextPage();
    });
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentFlashSalePageIndex = 0;
  int currentTabIndex = 0;

  void onTabChanged(value) {
    currentTabIndex = value;
    emit(HomeOnTabChangedState());
  }

  void onPageChanged(value) {
    currentFlashSalePageIndex = value;
    emit(HomeOnPageChangedState());
  }

  List<Widget> tabBar = const [AllTab(), WomenTab(), MenTab(), KidTab()];
  List<Map<String, String>> collection = const [
    {
      "image": AppImages.winter,
      "text": "Winter",
    },
    {
      "image": AppImages.spring,
      "text": "Spring",
    },
    {
      "image": AppImages.summer,
      "text": "Summer",
    },
    {
      "image": AppImages.autumn,
      "text": "Autumn",
    },
  ];
  List<Map<String, String>> sales = const [
    {
      "image": AppImages.slider1,
      "title": "Special promo",
      "description": "Holiday edition promo on all summer collection",
      "discount": "75"
    },
    {
      "image": AppImages.slider2,
      "title": "Accessories sale",
      "description": "Accessories edition promo on all accessories",
      "discount": "30"
    },
    {
      "image": AppImages.slider3,
      "title": "Winter sale",
      "description": "Winter edition promo on all winter collection",
      "discount": "15"
    },
  ];
  List<Map<String, String>> categoriesAvatar = const [
    {
      "image": AppImages.tShirt,
      "title": "T-shirts",
    },
    {
      "image": AppImages.hoodie,
      "title": "Hoodies",
    },
    {
      "image": AppImages.pants,
      "title": "Pants",
    },
    {
      "image": AppImages.skirt,
      "title": "Skirts",
    },
    {
      "image": AppImages.footwear,
      "title": "Footwear",
    },
    {
      "image": AppImages.accessories,
      "title": "Accessories",
    },
    {
      "image": AppImages.more,
      "title": "More!",
    },
  ];

  List<PersistentBottomNavBarItem> navBarsItems(context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: AppColors.silverDark,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag),
        //icon: SvgPicture.asset(AppIcons.bag),
        title: "cart",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: AppColors.silverDark,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "Favorites",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: AppColors.silverDark,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Settings",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: AppColors.silverDark,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: AppColors.silverDark,
      ),
    ];
  }

  List<Widget> buildScreens() {
    return [
      const HomeTab(),
      const CartTab(),
      const FavTab(),
      const SettingsTab(),
      const ProfileTab(),
    ];
  }

  PageController flashSalePageController = PageController(initialPage: 0);

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  // Method to change to the next page
  void nextPage() {
    if (currentFlashSalePageIndex < sales.length - 1) {
      currentFlashSalePageIndex++;
    } else {
      currentFlashSalePageIndex = 0;
      emit(HomeOnPageChangedState());
    }
    flashSalePageController.animateToPage(
      currentFlashSalePageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    emit(HomeOnPageChangedState());
  }
}
