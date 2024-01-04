import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/core/utils/app_images.dart';

class OnBoardProvider extends ChangeNotifier {
  int currentPageIndex = 0;

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
    notifyListeners();
  }

  onNextButton() {
    if (currentPageIndex < 2) {
      currentPageIndex++;
    }
    notifyListeners();
  }

  onBackButton() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
    }
    notifyListeners();
  }
}
