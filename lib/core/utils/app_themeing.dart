import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_ecommerce_app/core/utils/app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightColor,
      onPrimary: AppColors.gold,
      onPrimaryContainer: Colors.white,
      onSecondaryContainer: Color(0x70FFFFFF),
      secondary: Color(0xB8CCB17F),
      onSecondary: Colors.black,
      error: AppColors.red,
      onError: Colors.transparent,
      background: Colors.white,
      onBackground: Colors.white,
      surface: AppColors.lightColor,
      onSurface: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
    ),
    buttonTheme: const ButtonThemeData(
      hoverColor: Colors.white,
      highlightColor: Colors.white,
      splashColor: Colors.white,
      focusColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightColor,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.silverDark,
      selectedLabelStyle: TextStyle(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.white),
    ),
    dialogBackgroundColor: Colors.white,
    disabledColor: AppColors.lightGray,
    iconTheme: const IconThemeData(color: AppColors.lightColor),
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.black,
        onPrimary: Colors.black,
        onPrimaryContainer: Colors.black,
        onSecondaryContainer: Color(0x8E141A2E),
        // secondary >> num of tasbeh
        secondary: Colors.black,
        onSecondary: Colors.yellow,
        error: Colors.red,
        onError: Colors.transparent,
        // background >> tasbeh
        background: Colors.yellow,
        onBackground: Colors.black,
        // surface >> divider color
        surface: Colors.yellow,
        onSurface: Colors.yellow,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Color(0xFFFACC1D),
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.white),
      ));
}
