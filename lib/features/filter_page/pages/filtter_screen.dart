import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:la_mode/features/filter_page/management/filter_cubit.dart';
import 'package:la_mode/features/filter_page/management/filter_state.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';
import '../../home/presentation/manager/provider/home_cubit.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: BlocConsumer<FilterCubit, FilterState>(
        listener: (context, state) {},
        builder: (context, state) => DefaultTabController(
          length: 4,
          child: Scaffold(
            body: NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      'Filter',
                      style: roboto20(
                        weight: FontWeight.w700,
                      ),
                    ),
                    centerTitle: false,
                    actions: [
                      BagIcon(
                        bagCount: 4,
                        onPressed: () {
                          HomeCubit.get(context).controller.index = 1;
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_horiz))
                    ],
                    bottom: TabBar(
                      labelColor: AppColors.lightColor,
                      labelStyle: roboto14().copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600),
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      unselectedLabelColor: AppColors.lightColor,
                      unselectedLabelStyle: roboto14(),
                      indicator: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      isScrollable: true,
                      tabs: const [
                        Tab(
                          child: Text('All'),
                        ),
                        Tab(
                          child: Text('Sale'),
                        ),
                        Tab(
                          child: Text('Top'),
                        ),
                        Tab(
                          child: Text('New'),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                      child: FilterCubit.get(context).tabBar[0]),
                  FilterCubit.get(context).tabBar[1],
                  FilterCubit.get(context).tabBar[2],
                  FilterCubit.get(context).tabBar[3],
                ],
              ),
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.sp),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: MyButton(
                          onPressed: () {
                            FilterCubit.get(context).resetAllCheck();
                            Navigator.pop(context);
                          },
                          text: "Reset All",
                          textColor: AppColors.lightColor,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: MyButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: "Apply",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
