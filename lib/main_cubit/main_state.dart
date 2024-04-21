import 'package:flutter/material.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class ConnectionPlusConnected extends MainState {}

class InternetCheckerConnected extends MainState {}

class ConnectionPlusNotConnected extends MainState {}

class InternetCheckerNotConnected extends MainState {}

class MainHasRestoredConnection extends MainState {}

class MainLoadingState extends MainState {}

class MainToggleTheme extends MainState {}

class MainToggleLang extends MainState {
  final Locale locale;

  MainToggleLang({required this.locale});
}

class OnBoardChange extends MainState {}
