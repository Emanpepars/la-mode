import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

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
}
