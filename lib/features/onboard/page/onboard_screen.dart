import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/config/routes.dart';
import 'package:la_mode/core/utils/app_colors.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/main_cubit/main_state.dart';
import '../../../core/utils/text_styles.dart';
import '../../../main_cubit/main_cubit.dart';
import '../widgets/onboard_image.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 460.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150.sp),
                  ),
                  child: PageView.builder(
                    controller: MainCubit.get(context).pageController,
                    onPageChanged: (value) {
                      MainCubit.get(context).onPageChanged(value);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return OnboardImage(
                          onboardImg: MainCubit.get(context).onboardList[index]
                              ["image"]!,
                          skip: MainCubit.get(context).currentPageIndex !=
                              MainCubit.get(context).onboardList.length - 1);
                    },
                    itemCount: MainCubit.get(context).onboardList.length,
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
                          width:
                              MainCubit.get(context).currentPageIndex == index
                                  ? 40.w
                                  : 15.w,
                          decoration: BoxDecoration(
                            color:
                                MainCubit.get(context).currentPageIndex == index
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
                MainCubit.get(context)
                        .onboardList[MainCubit.get(context).currentPageIndex]
                    ["title"]!,
                style: roboto20(),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 250.w,
                child: Text(
                  MainCubit.get(context)
                          .onboardList[MainCubit.get(context).currentPageIndex]
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
                child: MainCubit.get(context).currentPageIndex == 0
                    ? MyButton(
                        text: "Next".tr(),
                        onPressed: () {
                          MainCubit.get(context).onNextButton();
                          MainCubit.get(context).pageController.animateToPage(
                              MainCubit.get(context).currentPageIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        },
                      )
                    : MainCubit.get(context).currentPageIndex ==
                            MainCubit.get(context).onboardList.length - 1
                        ? Row(
                            children: [
                              Expanded(
                                child: MyButton(
                                  text: "back".tr(),
                                  color: Colors.white,
                                  textColor: AppColors.lightColor,
                                  onPressed: () {
                                    MainCubit.get(context).onBackButton();
                                    MainCubit.get(context)
                                        .pageController
                                        .animateToPage(
                                            MainCubit.get(context)
                                                .currentPageIndex,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve:
                                                Curves.fastEaseInToSlowEaseOut);
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
                                    Navigator.pushNamed(
                                        context, Routes.register);
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
                                    MainCubit.get(context).onBackButton();
                                    MainCubit.get(context)
                                        .pageController
                                        .animateToPage(
                                            MainCubit.get(context)
                                                .currentPageIndex,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve:
                                                Curves.fastEaseInToSlowEaseOut);
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
                                    MainCubit.get(context).onNextButton();
                                    MainCubit.get(context)
                                        .pageController
                                        .animateToPage(
                                          MainCubit.get(context)
                                              .currentPageIndex,
                                          duration:
                                              const Duration(milliseconds: 500),
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
        ),
      ),
    );
  }
}
