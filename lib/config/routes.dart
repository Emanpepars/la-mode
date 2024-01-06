import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/core/utils/app_components.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/home_screen.dart';
import 'package:my_ecommerce_app/features/onboard/onboard_screen.dart';

class Routes {
  static const String onboard = 'onboard';
  static const String home = '/';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboard:
        return MaterialPageRoute(builder: (context) => const OnBoardScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => AppComponents.unDefineRoute());
    }
  }
}
