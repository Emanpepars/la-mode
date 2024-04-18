import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:la_mode/core/utils/app_constants.dart';
import 'app.dart';
import 'config/routes.dart';
import 'core/utils/app_observer.dart';
import 'core/utils/cache_helper.dart';
import 'features/auth/register/domain/entities/user_entity.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  var userBox = await Hive.openBox(AppConstants.kUSerBox);
  String route;
  if (userBox.isEmpty || userBox.getAt(0) == null) {
    route = Routes.onboard;
  } else {
    route = Routes.home;
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      /// --- file lang path ---- ///
      path: 'assets/translations',
      fallbackLocale: Locale(
        CacheHelper.getData("lang") == "Arabic" ? 'ar' : 'en',
      ),

      child: MyApp(route: route),
      // child: MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Model Viewer')),
//         body: const ModelViewer(
//           backgroundColor: Colors.transparent,
//           src: 'assets/3d/sport_sneakers_3d_model.glb',
//           alt: 'A 3D model of an sport sneakers',
//           ar: true,
//           autoRotate: true,
//           iosSrc: 'assets/3d/sport_sneakers_3d_model.glb',
//           disableZoom: true,
//         ),
//       ),
//     );
//   }
// }
