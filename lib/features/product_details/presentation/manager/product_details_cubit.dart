import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/product_details/presentation/manager/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  late Timer timer;

  final int length;

  ProductDetailsCubit(this.length) : super(ProductDetailsInitial()) {
    timer = Timer.periodic(const Duration(milliseconds: 10000), (timer) {
      nextPage(length);
    });
  }

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  int currentPageIndex = 0;
  int colorIndex = 0;
  int sizeSelectedIndex = 0;
  List<Color> colors = const [
    Color(0xFF010203),
    Color(0xFF6C3A22),
    Color(0xFF905B39),
    Color(0xFFD0D0CC)
  ];
  List<String> sizes = const ["S", "M", "L", "XL", "XXL"];
  PageController currentPageController = PageController(initialPage: 0);

  void nextPage(int length) {
    if (currentPageIndex < length - 1) {
      currentPageIndex++;
    } else {
      currentPageIndex = 0;
      emit(ProductDetailsOnPageChangedState());
    }
    currentPageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    emit(ProductDetailsOnPageChangedState());
  }

  void onPageChanged(value) {
    currentPageIndex = value;
    emit(ProductDetailsOnPageChangedState());
  }

  void onColorTap(int index) {
    colorIndex = index;
    emit(ProductDetailsOnPageChangedState());
  }

  void onSizeTap(index) {
    sizeSelectedIndex = index;
    emit(ProductDetailsOnPageChangedState());
  }
}
