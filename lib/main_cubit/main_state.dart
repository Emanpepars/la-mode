import 'package:flutter/material.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class MainToggleTheme extends MainState {}

class MainToggleLang extends MainState {
  final Locale locale;

  MainToggleLang({required this.locale});
}
