import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../core/utils/app_images.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final StreamController<bool> internetStreamController =
      StreamController<bool>.broadcast();

  MainCubit() : super(MainInitial()) {
    // Listen for connectivity changes
    Connectivity().onConnectivityChanged.listen((result) {
      checkConnectivity();
    });

    // Listen for internet connection changes using InternetConnectionChecker
    listenForInternetConnectionChanges();
  }

  // Check connectivity status initially
  void checkConnectivity() async {
    // Use Connectivity to check internet connectivity
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(ConnectionPlusNotConnected());
    } else {
      emit(ConnectionPlusConnected());
    }
  }

  // Listen for connectivity changes
  void listenForConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((result) {
      checkConnectivity();
    });
  }

  // Listen for internet connection changes using InternetConnectionChecker
  void listenForInternetConnectionChanges() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        emit(InternetCheckerConnected());
      } else {
        emit(InternetCheckerNotConnected());
      }
    });
  }

  static MainCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    internetStreamController.close();
    return super.close();
  }

  ThemeMode themeMode = ThemeMode.light;
  Locale locale = const Locale('en');

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    emit(MainToggleTheme());
  }

  void toggleLanguage(BuildContext context, String lang) {
    locale = lang == "English"
        ? const Locale('en')
        : lang == "Arabic"
            ? const Locale('ar')
            : const Locale('en');
    emit(
      MainToggleLang(
        locale: lang == "English"
            ? const Locale('en')
            : lang == "Arabic"
                ? const Locale('ar')
                : const Locale('en'),
      ),
    );
    EasyLocalization.of(context)!.setLocale(
      lang == "English"
          ? const Locale('en')
          : lang == "Arabic"
              ? const Locale('ar')
              : const Locale('en'),
    );
  }

  ///--- onBoard ---///

  int currentPageIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Map<String, String>> onboardList = [
    {
      "title": "Your own style",
      "description":
          "Smart, gorgeous and fashionable collection that make you cool!",
      "image": AppImages.onboard1,
    },
    {
      "title": "Discover fashion",
      "description": "With us you can find variety of the world's best fashion",
      "image": AppImages.onboard2,
    },
    {
      "title": "Latest outfits",
      "description":
          "Express your kid's personality through the art of fashion",
      "image": AppImages.onboard3,
    }
  ];

  onPageChanged(value) {
    currentPageIndex = value;
    emit(OnBoardChange());
  }

  onNextButton() {
    if (currentPageIndex < 2) {
      currentPageIndex++;
    }
    emit(OnBoardChange());
  }

  onBackButton() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
    }
    emit(OnBoardChange());
  }
}
