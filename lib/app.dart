import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/features/category/presentation/manager/category_cubit.dart';
import 'package:la_mode/features/sellers/presentation/manager/sellers_cubit.dart';
import 'package:la_mode/main_cubit/main_cubit.dart';
import 'package:la_mode/main_cubit/main_state.dart';
import 'package:la_mode/provider/OnBoardProider.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_themeing.dart';
import 'features/home/presentation/manager/provider/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => OnBoardProvider()),
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
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
        ],
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            /// --- localization ---- ///
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: MainCubit.get(context).locale,
            theme: MyThemeData.lightTheme,
            darkTheme: MyThemeData.darkTheme,
            themeMode: MainCubit.get(context).themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
          ),
        ),
      ),
    );
  }
}
