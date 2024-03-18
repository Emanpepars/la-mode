import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/category/presentation/pages/category_screen.dart';
import 'package:la_mode/features/home/presentation/pages/home_screen.dart';
import 'package:la_mode/features/login/presentation/pages/login_screen.dart';
import 'package:la_mode/features/login/presentation/pages/otp_code_screen.dart';
import 'package:la_mode/features/onboard/page/onboard_screen.dart';
import 'package:la_mode/features/register/domain/entities/user_entity.dart';
import 'package:la_mode/features/register/presentation/pages/register_screen.dart';
import 'package:la_mode/features/reviews/presentation/pages/reviews_screen.dart';

import '../core/utils/app_constants.dart';
import '../features/login/presentation/pages/forgot_passwors_screen.dart';
import '../features/product_details/presentation/pages/product_details_screen.dart';
import '../features/sellers/presentation/pages/sellers_screen.dart';

class Routes {
  static const String onboard = 'onboard';
  static const String register = 'register';
  static const String login = 'login';
  static const String forgetPassword = '/';
  static const String otpCode = 'otpCode';
  static const String home = 'home';
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
      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case Routes.otpCode:
        return MaterialPageRoute(builder: (context) => const OtpCodeScreen());
      case Routes.home:
        var userBox = Hive.box(AppConstants.kUSerBox);
        UserEntity userEntity;
        if (userBox.isEmpty || userBox.getAt(0) == null) {
          userEntity = routeSettings.arguments as UserEntity;
        } else {
          userEntity = userBox.getAt(0);
        }
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            userEntity: userEntity,
          ),
        );

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
