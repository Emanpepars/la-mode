import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/core/utils/app_components.dart';
import 'package:my_ecommerce_app/features/category/presentation/pages/category_screen.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/home_screen.dart';
import 'package:my_ecommerce_app/features/onboard/onboard_screen.dart';

import '../features/product_details/presentation/pages/product_details_screen.dart';

class Routes {
  static const String onboard = 'onboard';
  static const String home = '/';
  static const String category = 'category';
  static const String productDetails = 'productDetails';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboard:
        return MaterialPageRoute(builder: (context) => const OnBoardScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.productDetails:
        return MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen());
      case Routes.category:
        String categoryTitle = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(
            categoryTitle: categoryTitle,
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => AppComponents.unDefineRoute());
    }
  }
}
