import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/core/utils/app_components.dart';
import 'package:my_ecommerce_app/features/onboard/onboard_screen.dart';

class Routes {
  static const String onboard = '/';
}

class AppRoutes {

  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboard:
        return MaterialPageRoute(builder: (context) => const OnBoardScreen());
      default:
        return MaterialPageRoute(builder: (context) => AppComponents.unDefineRoute());
    }
  }
}
