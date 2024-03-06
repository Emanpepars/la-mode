import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/utils/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],

      /// --- file lang path ---- ///
      path: 'assets/translations',
      fallbackLocale:
          Locale(CacheHelper.getData("lang") == "Arabic" ? 'ar' : 'en'),
      child: const MyApp(),
    ),
  );
}
