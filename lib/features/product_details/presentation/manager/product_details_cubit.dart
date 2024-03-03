import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce_app/features/product_details/presentation/manager/product_details_state.dart';

import '../../../../core/utils/app_images.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  late Timer timer;

  ProductDetailsCubit() : super(ProductDetailsInitial()) {
    timer = Timer.periodic(const Duration(milliseconds: 50000000), (timer) {
      nextPage();
    });
  }

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  int currentFlashSalePageIndex = 0;
  int colorIndex = 0;
  int sizeSelectedIndex = 0;
  List<Map<String, String>> sales = const [
    {
      "image": AppImages.slider1,
      "title": "Gucci Bubble Suit - Multiple Colors",
      "description":
          "Specifically a number of colored blazers characterized by constructed shoulders, elegant buttons and comfy pants. It's available in multiple. ",
      "price": "150",
    },
    {
      "image": AppImages.slider2,
      "title": "Accessories sale",
      "description": "Accessories edition promo on all accessories",
      "price": "150",
    },
    {
      "image": AppImages.slider3,
      "title": "Winter sale",
      "description": "Winter edition promo on all winter collection",
      "price": "150",
    },
  ];
  List<Color> colors = const [
    Color(0xFF010203),
    Color(0xFF6C3A22),
    Color(0xFF905B39),
    Color(0xFFD0D0CC)
  ];
  List<String> sizes = const ["S", "M", "L", "XL", "XXL"];
  PageController flashSalePageController = PageController(initialPage: 0);

  void nextPage() {
    if (currentFlashSalePageIndex < sales.length - 1) {
      currentFlashSalePageIndex++;
    } else {
      currentFlashSalePageIndex = 0;
      emit(ProductDetailsOnPageChangedState());
    }
    flashSalePageController.animateToPage(
      currentFlashSalePageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    emit(ProductDetailsOnPageChangedState());
  }

  void onPageChanged(value) {
    currentFlashSalePageIndex = value;
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
