import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:la_mode/core/utils/app_constants.dart';
import 'app.dart';
import 'config/routes.dart';
import 'core/utils/app_observer.dart';
import 'core/utils/cache_helper.dart';
import 'features/auth/register/domain/entities/user_entity.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

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

  ///--- NOTIFICATION ---///

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      var token = await FirebaseMessaging.instance.getToken();
      print("Fcm Token : $token");

      AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic notifications',
            defaultColor: Colors.blue,
            ledColor: Colors.white,
          ),
        ],
      );

      FirebaseMessaging.onMessage.listen((event) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 2,
            channelKey: 'basic_channel',
            title: event.notification?.title ?? 'Notification',
            body:
                event.notification?.body ?? 'This is an awesome notification!',
          ),
        );
      });
      FirebaseMessaging.onMessageOpenedApp.listen((event) {});

      ///--- background fcm ---///
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
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
    } else {
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
  } else {
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
}
