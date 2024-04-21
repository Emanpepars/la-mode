import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:la_mode/features/home/presentation/manager/provider/home_state.dart';
import '../../../../../../../../core/utils/app_components.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => FirstPart(
        appBarTitle: 'Home'.tr(),
        leadingIcon: Icons.menu,
        currentTabIndex: HomeCubit.get(context).currentTabIndex,
        tabBarView: [
          HomeCubit.get(context).isSearch
              ? BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is GetAllProductSuccess) {
                      return Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  bottom: 10.h,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductCard(
                                    dataEntity: HomeCubit.get(context)
                                        .filteredProducts[index],
                                  );
                                },
                                itemCount: HomeCubit.get(context)
                                    .filteredProducts
                                    .length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.h,
                                  mainAxisSpacing: 10.w,
                                  childAspectRatio: 2.w / 2.66.h,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 10.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CategoryName(
                                        title: 'You may also like'.tr()),
                                    const ViewALl(),
                                  ],
                                ),
                              ),

                              ///--- Products ---///
                              GridView.builder(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  bottom: 40.h,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    ProductCardWithSeller(
                                  dataEntity:
                                      HomeCubit.get(context).products[index],
                                ),
                                itemCount:
                                    HomeCubit.get(context).products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.h,
                                  mainAxisSpacing: 10.w,
                                  childAspectRatio: 2.w / 2.66.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (state is NotFoundFilterProduct) {
                      return Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 0.h,
                                ),
                                child: Text(
                                  'Item not found',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 10.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CategoryName(
                                        title: 'You may also like'.tr()),
                                    const ViewALl(),
                                  ],
                                ),
                              ),

                              ///--- Products ---///
                              GridView.builder(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  bottom: 40.h,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    ProductCardWithSeller(
                                  dataEntity:
                                      HomeCubit.get(context).products[index],
                                ),
                                itemCount:
                                    HomeCubit.get(context).products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.h,
                                  mainAxisSpacing: 10.w,
                                  childAspectRatio: 2.w / 2.66.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }else {
                      return Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  bottom: 10.h,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return const ProductShimmerCart();
                                },
                                itemCount: 2,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.h,
                                  mainAxisSpacing: 10.w,
                                  childAspectRatio: 2.w / 2.68.h,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 10.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CategoryName(
                                        title: 'You may also like'.tr()),
                                    const ViewALl(),
                                  ],
                                ),
                              ),

                              ///--- Products ---///
                              GridView.builder(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  bottom: 40.h,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    ProductCardWithSeller(
                                  dataEntity:
                                      HomeCubit.get(context).products[index],
                                ),
                                itemCount:
                                    HomeCubit.get(context).products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.h,
                                  mainAxisSpacing: 10.w,
                                  childAspectRatio: 2.w / 2.66.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                )
              : SingleChildScrollView(
                  child: HomeCubit.get(context).tabBar[0],
                ),
          const Center(child: Text('ًWoman content')),
          const Center(child: Text('Men content')),
          const Center(child: Text('Kids content')),
        ],
        onTabChanged: HomeCubit.get(context).onTabChanged,
      ),
    );
  }
}
