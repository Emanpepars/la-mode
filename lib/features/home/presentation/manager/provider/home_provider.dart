import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/core/utils/app_images.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/bottom_tabs/cart_tab.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/bottom_tabs/fav_tab.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/bottom_tabs/profile_tab.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/bottom_tabs/settings_tab.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/tab_view_tabs/kids_tab_bar.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/tab_view_tabs/men_tab_bar.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/tab_view_tabs/women_tab_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../pages/tab_view_tabs/all_tab.dart';
import '../../pages/bottom_tabs/home_tab_bar.dart';

class HomeProvider extends ChangeNotifier {
  int currentPageIndex = 0;

  onPageChanged(value) {
    currentPageIndex = value;
    notifyListeners();
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

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppColors.gold,
        inactiveColorPrimary: AppColors.silverDark,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag),
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
      HomeTab(),
      CartTab(),
      FavTab(),
      SettingsTab(),
      ProfileTab(),
    ];
  }

  late PageController pageController;
  late Timer pageChangeTimer;

  HomeProvider() {
    pageController = PageController();
    pageChangeTimer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      // Change page automatically every 5 seconds
      nextPage();
    });
  }

  // Method to change to the next page
  void nextPage() {
    if (currentPageIndex < sales.length - 1) {
     currentPageIndex ++;
    } else {
      currentPageIndex =0;
      notifyListeners();
    }
    pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    notifyListeners();
  }
}
