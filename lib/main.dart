import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'core/utils/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Model Viewer')),
        body: const ModelViewer(
          backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src: 'assets/3d/sport_sneakers_3d_model.glb',
          alt: 'A 3D model of an astronaut',
          ar: true,
          autoRotate: true,
          iosSrc: 'assets/3d/sport_sneakers_3d_model.glb',
          disableZoom: true,
        ),
      ),
    );
  }
}