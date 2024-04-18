import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/provider/OnBoardProider.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/text_styles.dart';
import '../widgets/onboard_image.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var onboardProvider = Provider.of<OnBoardProvider>(context);
    PageController pageController =
        PageController(initialPage: onboardProvider.currentPageIndex);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150.sp),
              ),
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  onboardProvider.onPageChanged(value);
                },
                itemBuilder: (BuildContext context, int index) {
                  return OnboardImage(
                      onboardImg: onboardProvider.onboardList[index]["image"]!,
                      skip: onboardProvider.currentPageIndex !=
                          onboardProvider.onboardList.length - 1);
                },
                itemCount: onboardProvider.onboardList.length,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (index) => Container(
                      margin: EdgeInsets.only(right: 5.w),
                      height: 5.h,
                      width: onboardProvider.currentPageIndex == index
                          ? 40.w
                          : 15.w,
                      decoration: BoxDecoration(
                        color: onboardProvider.currentPageIndex == index
                            ? AppColors.lightColor
                            : AppColors.silverM,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            onboardProvider.onboardList[onboardProvider.currentPageIndex]
                ["title"]!,
            style: roboto20(),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 250.w,
            child: Text(
              onboardProvider.onboardList[onboardProvider.currentPageIndex]
                  ["description"]!,
              style: roboto16W400(),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: onboardProvider.currentPageIndex == 0
                ? MyButton(
                    text: "Next".tr(),
                    onPressed: () {
                      onboardProvider.onNextButton();
                      pageController.animateToPage(
                          onboardProvider.currentPageIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn);
                    },
                  )
                : onboardProvider.currentPageIndex ==
                        onboardProvider.onboardList.length - 1
                    ? Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              text: "back".tr(),
                              color: Colors.white,
                              textColor: AppColors.lightColor,
                              onPressed: () {
                                onboardProvider.onBackButton();
                                pageController.animateToPage(
                                    onboardProvider.currentPageIndex,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastEaseInToSlowEaseOut);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: MyButton(
                              text: "Start".tr(),
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.register);
                              },
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              text: "back".tr(),
                              color: Colors.white,
                              textColor: AppColors.lightColor,
                              onPressed: () {
                                onboardProvider.onBackButton();
                                pageController.animateToPage(
                                    onboardProvider.currentPageIndex,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastEaseInToSlowEaseOut);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: MyButton(
                              text: "Next".tr(),
                              onPressed: () {
                                onboardProvider.onNextButton();
                                pageController.animateToPage(
                                  onboardProvider.currentPageIndex,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
