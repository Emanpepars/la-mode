import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/category/presentation/pages/tab_view_tabs/all_tab.dart';
import 'package:la_mode/features/category/presentation/pages/tab_view_tabs/kids_tab_bar.dart';
import 'package:la_mode/features/category/presentation/pages/tab_view_tabs/men_tab_bar.dart';
import 'package:la_mode/features/category/presentation/pages/tab_view_tabs/women_tab_bar.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  List<Widget> tabBar = const [AllTab(), WomenTab(), MenTab(), KidTab()];

  int currentTabIndex = 0;

  void onTabChanged(value) {
    currentTabIndex = value;
    emit(CategoryOnTabChangedState());
  }
}
