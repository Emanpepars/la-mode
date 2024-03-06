import 'package:flutter/material.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/category/presentation/pages/category_screen.dart';
import 'package:la_mode/features/home/presentation/pages/home_screen.dart';
import 'package:la_mode/features/onboard/onboard_screen.dart';
import 'package:la_mode/features/reviews/presentation/pages/reviews_screen.dart';

import '../features/product_details/presentation/pages/product_details_screen.dart';
import '../features/sellers/presentation/pages/sellers_screen.dart';

class Routes {
  static const String onboard = 'onboard';
  static const String home = '/';
  static const String category = 'category';
  static const String productDetails = 'productDetails';
  static const String review = 'review';
  static const String sellers = 'sellers';
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
      case Routes.review:
        return MaterialPageRoute(builder: (context) => const ReviewsScreen());
      case Routes.sellers:
        return MaterialPageRoute(builder: (context) => const SellersScreen());

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
