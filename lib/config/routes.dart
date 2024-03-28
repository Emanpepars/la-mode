import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/category/presentation/pages/category_screen.dart';
import 'package:la_mode/features/check_out/checkout/presentation/pages/check_out_screen.dart';
import 'package:la_mode/features/check_out/payment/presentation/pages/visa.dart';
import 'package:la_mode/features/filter_page/pages/filtter_screen.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';
import 'package:la_mode/features/home/presentation/pages/home_screen.dart';
import 'package:la_mode/features/auth/login/presentation/pages/login_screen.dart';
import 'package:la_mode/features/auth/login/presentation/pages/forget_password/otp_code_screen.dart';
import 'package:la_mode/features/auth/login/presentation/pages/forget_password/reset_password.dart';
import 'package:la_mode/features/notification/presentation/pages/notification_screen.dart';
import 'package:la_mode/features/onboard/page/onboard_screen.dart';
import 'package:la_mode/features/promo_code/presentation/pages/promo_code_screen.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_entity.dart';
import 'package:la_mode/features/auth/register/presentation/pages/register_screen.dart';
import 'package:la_mode/features/reviews/presentation/pages/reviews_screen.dart';
import 'package:la_mode/features/seller/seller_details/presentation/pages/seller_details.dart';

import '../core/utils/app_constants.dart';
import '../features/auth/login/presentation/pages/forget_password/forgot_passwors_screen.dart';
import '../features/check_out/add_new_address/presentation/pages/add_new_address_screen.dart';
import '../features/product_details/presentation/pages/product_details_screen.dart';
import '../features/seller/sellers/presentation/pages/sellers_screen.dart';

class Routes {
  static const String onboard = 'onboard';
  static const String register = 'register';
  static const String login = 'login';
  static const String forgetPassword = 'forgetPassword';
  static const String otpCode = 'otpCode';
  static const String resetPassword = 'resetPassword';
  static const String home = 'home';
  static const String notification = 'notification';
  static const String filter = 'filter';

  static const String category = 'category';

  static const String productDetails = 'productDetails';
  static const String review = 'review';
  static const String sellers = 'sellers';
  static const String sellerDetails = 'sellerDetails';
  static const String promoCodes = 'promoCodes';

  ///--- Checkout ---///
  static const String checkout = 'checkout';
  static const String visa = '/';

  ///--- address ---///
  static const String address = 'address';
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
        bool isPhone = routeSettings.arguments as bool;
        return MaterialPageRoute(
            builder: (context) => OtpCodeScreen(
                  isPhone: isPhone,
                ));
      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen());
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
      case Routes.checkout:
        var userBox = Hive.box(AppConstants.kUSerBox);
        UserEntity userEntity;
        userEntity = userBox.getAt(0);
        List<ProductItem> productItems =
            routeSettings.arguments as List<ProductItem>;
        return MaterialPageRoute(
          builder: (context) => CheckoutScreen(
            userEntity: userEntity,
            items: productItems,
          ),
        );

      case Routes.visa:
        return MaterialPageRoute(builder: (context) => const VisaScreen());
      case Routes.address:
        return MaterialPageRoute(builder: (context) => const AddNewAddress());

      case Routes.notification:
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
      case Routes.filter:
        return MaterialPageRoute(builder: (context) => const FilterScreen());

      case Routes.productDetails:
        return MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen());
      case Routes.review:
        return MaterialPageRoute(builder: (context) => const ReviewsScreen());
      case Routes.sellers:
        return MaterialPageRoute(builder: (context) => const SellersScreen());
      case Routes.sellerDetails:
        return MaterialPageRoute(
            builder: (context) => const SellerDetailsScreen());

      case Routes.category:
        String categoryTitle = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(
            categoryTitle: categoryTitle,
          ),
        );
      case Routes.promoCodes:
        return MaterialPageRoute(builder: (context) => const PromoCodeScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => AppComponents.unDefineRoute());
    }
  }
}
