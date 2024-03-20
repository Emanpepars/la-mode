import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/filter_page/pages/tabs/filter_all_tab.dart';
import 'package:la_mode/features/filter_page/pages/tabs/filter_new_tab.dart';
import 'package:la_mode/features/filter_page/pages/tabs/filter_sale_tab.dart';
import 'package:la_mode/features/filter_page/pages/tabs/filter_top_tab.dart';

import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  static FilterCubit get(context) => BlocProvider.of(context);

  List<Widget> tabBar = const [
    FilterAllTab(),
    FilterSaleTab(),
    FilterTopTab(),
    FilterNewTab(),
  ];
  List<String> sizes = const ["S", "M", "L", "XL", "XXL"];
  List<double> rate = const [1.0, 2.0, 3.0, 4.0, 5.0];

  List<Color> colors = const [
    Color(0xFF010203),
    Color(0xFF6C3A22),
    Color(0xFF905B39),
    Color(0xFFD0D0CC)
  ];

  List<String> brands = [
    "H&M",
    "Adidas",
    "Louis Vuitton",
    "Ralph Lauren",
    "Prada",
    "Versace",
    "Nike",
    "Gucci"
  ];

  List<String> collection = const [
    "Autumn",
    "Winter",
    "Spring",
    "Summer",
  ];
  double startValue = 52.0;
  double endValue = 250.0;

  int colorIndex = 0;
  int rateIndex = 0;
  int sizeSelectedIndex = 0;
  List<String> selectedFilterOptions = [];
  List<String> selectedCollectionOptions = [];

  onChangedSlider(RangeValues values) {
    startValue = values.start;
    endValue = values.end;
    emit(FilterUpdateState());
  }

  void onRateTap(int index) {
    rateIndex = index;
    emit(FilterUpdateState());
  }

  void onColorTap(int index) {
    colorIndex = index;
    emit(FilterUpdateState());
  }

  void onSizeTap(index) {
    sizeSelectedIndex = index;
    emit(FilterUpdateState());
  }

  onMultiSelectFilterAlert(String string) {
    if (selectedFilterOptions.contains(string)) {
      selectedFilterOptions.remove(string);
    } else {
      selectedFilterOptions.add(string);
    }
    emit(FilterUpdateState());
  }

  onMultiSelectCollection(String string) {
    if (selectedFilterOptions.contains(string)) {
      selectedFilterOptions.remove(string);
    } else {
      selectedFilterOptions.add(string);
    }
    emit(FilterUpdateState());
  }
}
