import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/core/api/dio_consumer.dart';
import 'package:la_mode/features/category/presentation/manager/category_cubit.dart';
import 'package:la_mode/features/check_out/checkout/presentation/manager/check_out_cubit.dart';
import 'package:la_mode/features/home/data/data_sources/home_dto.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/payment/payment_cubit.dart';
import 'package:la_mode/main_cubit/main_cubit.dart';
import 'package:la_mode/main_cubit/main_state.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_themeing.dart';
import 'features/home/presentation/manager/provider/home_cubit.dart';
import 'features/home/presentation/pages/bottom_tabs/cart_tab/data/data_sources/cart_dto.dart';
import 'features/home/presentation/pages/bottom_tabs/cart_tab/presentation/manager/cart_cubit.dart';
import 'features/home/presentation/pages/bottom_tabs/wishlist/data/data_sources/wishlist_dto.dart';
import 'features/home/presentation/pages/bottom_tabs/wishlist/presentation/manager/wishlist_cubit.dart';
import 'features/seller/sellers/presentation/manager/sellers_cubit.dart';

class MyApp extends StatelessWidget {
  final String route;

  const MyApp({required this.route, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
              RemoteHomeDto(
                DioConsumer(
                  dio: Dio(),
                ),
              ),
            )..getAllProduct(),
          ),
          BlocProvider(
            create: (context) =>
                CartCubit(RemoteCartDto(DioConsumer(dio: Dio())))
                  ..getCartItems(),
          ),
          BlocProvider<WishlistCubit>(
            create: (context) => WishlistCubit(
              RemoteWishlistDto(
                DioConsumer(
                  dio: Dio(),
                ),
              ),
            )..getWishlist(),
          ),
          BlocProvider<MainCubit>(
            create: (context) => MainCubit(),
          ),
          BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit(),
          ),
          BlocProvider<SellersCubit>(
            create: (context) => SellersCubit(),
          ),
          BlocProvider<CheckOutCubit>(
            create: (context) => CheckOutCubit(),
          ),
          BlocProvider<PaymentCubit>(
            create: (context) => PaymentCubit(),
          ),
        ],
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
          },
          builder: (context, state) => MaterialApp(
            /// --- localization ---- ///
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: MainCubit.get(context).locale,
            theme: MyThemeData.lightTheme,
            darkTheme: MyThemeData.darkTheme,
            themeMode: MainCubit.get(context).themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
          ),
        ),
      ),
    );
  }
}
