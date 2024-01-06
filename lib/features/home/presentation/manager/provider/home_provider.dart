import 'package:flutter/widgets.dart';
import 'package:my_ecommerce_app/core/utils/app_images.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/all_tab_bar.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/kids_tab_bar.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/men_tab_bar.dart';
import 'package:my_ecommerce_app/features/home/presentation/pages/women_tab_bar.dart';

class HomeProvider extends ChangeNotifier {

  int currentPageIndex = 0;

  onPageChanged(value) {
    currentPageIndex = value;
    notifyListeners();
  }

  List<Widget> tabBar = const [AllTab(), WomenTab(), MenTab(), KidTab()];

  List<Map<String, String>> collection = const [
    {
      "image": AppImages.winter,
      "text": "Winter",
    },
    {
      "image": AppImages.spring,
      "text": "Spring",
    },
    {
      "image": AppImages.summer,
      "text": "Summer",
    },
    {
      "image": AppImages.autumn,
      "text": "Autumn",
    },
  ];
  List<Map<String, String>> sales = const [
    {
      "image": AppImages.slider1,
      "title": "Special promo",
      "description": "Holiday edition promo on all summer collection",
      "discount": "75"
    },
    {
      "image": AppImages.slider2,
      "title": "Accessories sale",
      "description": "Accessories edition promo on all accessories",
      "discount": "30"
    },
    {
      "image": AppImages.slider3,
      "title": "Winter sale",
      "description": "Winter edition promo on all winter collection",
      "discount": "15"
    },
  ];
  List<Map<String, String>> categoriesAvatar = const [
    {
      "image": AppImages.onboard1,
      "title": "T-shirts",
    },
    {
      "image": AppImages.onboard1,
      "title": "Hoodies",
    },
    {
      "image": AppImages.onboard1,
      "title": "Pants",
    },
    {
      "image": AppImages.onboard1,
      "title": "Skirts",
    },
    {
      "image": AppImages.onboard1,
      "title": "Footwear",
    },
    {
      "image": AppImages.onboard1,
      "title": "Accessories",
    },
    {
      "image": AppImages.onboard1,
      "title": "More!",
    },
  ];
}
