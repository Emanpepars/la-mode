import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_cubit.dart';
import 'package:my_ecommerce_app/features/home/presentation/manager/provider/home_state.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../widgets/filter_alert_dialog.dart';
import '../../widgets/tab_label.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => DefaultTabController(
        length: 4,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                //snap: true,
                //  pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.white,
                    child: AppBar(
                      backgroundColor: Colors.white,
                      leading: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu, color: AppColors.primary),
                      ),
                      title: Text(
                        "Home",
                        style: roboto20(
                          weight: FontWeight.w700,
                        ),
                      ),
                      centerTitle: true,
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: const NotificationIcon(
                            notificationCount: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(90.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.silverM),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: TextField(
                                    cursorColor: AppColors.silverDark,
                                    style: roboto16().copyWith(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: roboto16().copyWith(
                                        color: AppColors.silverDark,
                                      ),
                                      prefixIcon: const Image(
                                        image: AssetImage(
                                          AppIcons.search,
                                        ),
                                        color: AppColors.silverDark,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const FilterAlertDialog();
                                    },
                                  );
                                },
                                icon: const Image(
                                  image: AssetImage(AppIcons.filter),
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          height: 17.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: const Text("FOR YOU"),
                                ),
                              ),
                              SizedBox(width: 30.w),
                              Expanded(
                                flex: 2,
                                child: TabBar(
                                  onTap: (value) {
                                    HomeCubit.get(context).onTabChanged(value);
                                  },
                                  labelColor: AppColors.gold,
                                  labelStyle: roboto14(),
                                  dividerColor: Colors.transparent,
                                  tabAlignment: TabAlignment.start,
                                  unselectedLabelColor: AppColors.primary,
                                  unselectedLabelStyle: roboto12W400(),
                                  indicatorColor: AppColors.gold,
                                  indicatorPadding:
                                      EdgeInsets.only(top: 16.5.h, left: 10.w),
                                  indicator: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: AppColors.gold,
                                  ),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  isScrollable: true,
                                  tabs: [
                                    TabLabel(
                                      text: 'All',
                                      isSelected: HomeCubit.get(context)
                                              .currentTabIndex ==
                                          0,
                                    ),
                                    TabLabel(
                                      text: 'Women',
                                      isSelected: HomeCubit.get(context)
                                              .currentTabIndex ==
                                          1,
                                    ),
                                    TabLabel(
                                      text: 'Men',
                                      isSelected: HomeCubit.get(context)
                                              .currentTabIndex ==
                                          2,
                                    ),
                                    TabLabel(
                                      text: 'Kids',
                                      isSelected: HomeCubit.get(context)
                                              .currentTabIndex ==
                                          3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: HomeCubit.get(context).tabBar[0],
              ),
              const Center(child: Text('ًWoman content')),
              const Center(child: Text('Men content')),
              const Center(child: Text('Kids content')),
            ],
          ),
        ),
      ),
    );
  }
}
